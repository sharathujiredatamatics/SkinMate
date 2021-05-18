//
//  DateTimeViewController.swift
//  BookAppointments
//
//  Created by techjini on 05/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit
import FSCalendar

class DateTimeViewController: UIViewController {
    
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var morningCollectioinView: UICollectionView!
    
    @IBOutlet weak var weekofDaysView: UIView!
    var isSelectedDate: Bool = false
    var isSelectedTime: Bool = false
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var proceedBtn: UIButton!
    @IBOutlet weak var afternoontimeCollectionView: UICollectionView!
    var date = Date()
    @IBOutlet weak var previousMonth: UIButton!
    @IBOutlet weak var nextMonth: UIButton!
    var calendar: FSCalendar!
    //slected date and time
    var selectedDate: String = "0000-00-00"
    var selectedtime = [String]()
    
    
    let morningTime: [String] = ["09:00","09:10","09:20","09:30","09:40","09:50","10:00","10:10","10:20","10:30","10:40","10:50","11:00","11:10","11:20","11:30","11:40"]
    
    let afternoonTime: [String] = ["12:50","01:00","01:10","01:20","01:30","01:40","01:50","02:00","02:10","02:20","02:30","02:40","02:50","03:00","03:10","03:20","03:30","03:40","03:50","04:00","04:10","04:20","04:30","04:40"]
    
    fileprivate lazy var dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         //back Button design
         backButton.layer.borderWidth = 1
         backButton.layer.borderColor = DesignColor.shared.getUIColor(hex: "#2122C")?.cgColor
         backButton.layer.cornerRadius = 7
         backButton.layer.masksToBounds = true
         backButton.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
         */
        //view border design
        let thickness: CGFloat = 1.0
        let calendarBorder = CALayer()
        calendarBorder.frame = CGRect(x: 0, y: self.calendarView.frame.height - thickness, width: self.calendarView.frame.size.width, height: thickness)
        calendarBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        calendarView.layer.addSublayer(calendarBorder)
        
        let calendarTopBorder = CALayer()
        calendarTopBorder.frame = CGRect(x: 0, y: 0, width: self.calendarView.frame.size.width, height: thickness)
        calendarTopBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        calendarView.layer.addSublayer(calendarTopBorder)
        
        //design view of calendar weekdays
        let viewBorder = CALayer()
        viewBorder.frame = CGRect(x: 0, y: self.weekofDaysView.frame.height - thickness, width: self.weekofDaysView.frame.size.width, height: thickness)
        viewBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        weekofDaysView.layer.addSublayer(viewBorder)
        
        let viewTopBorder = CALayer()
        viewTopBorder.frame = CGRect(x: 0, y: 0, width: self.weekofDaysView.frame.size.width, height: thickness)
        viewTopBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        weekofDaysView.layer.addSublayer(viewTopBorder)
        
        weekofDaysView.backgroundColor = DesignColor.shared.getUIColor(hex: "#F3F6F8")
        weekofDaysView.alpha = 0.3
        // Calendar deisgn
        calendar = FSCalendar(frame: CGRect(x: 20, y: 0.0, width: self.calendarView.frame.size.width-40, height: self.calendarView.frame.size.height))
        calendar.scrollEnabled = false
        
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 15.0)
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 21.0)
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 13.0)
        calendar.appearance.headerTitleColor = DesignColor.shared.getUIColor(hex: "#749BAD")
        calendar.appearance.weekdayTextColor = DesignColor.shared.getUIColor(hex: "#C8C9CC")
        calendar.appearance.todayColor = DesignColor.shared.getUIColor(hex: "#BDBDBD")
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.titleDefaultColor = DesignColor.shared.getUIColor(hex: "#111111")
        calendar.weekdayHeight =  44
        calendar.headerHeight = 78
        calendar.delegate = self
        calendar.dataSource = self
        calendarView.addSubview(calendar)
        addButtons()
        
        morningCollectioinView.delegate = self
        afternoontimeCollectionView.delegate = self
        morningCollectioinView.dataSource = self
        afternoontimeCollectionView.dataSource = self
        morningCollectioinView.allowsMultipleSelection = true
        afternoontimeCollectionView.allowsMultipleSelection = true
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment2") as! SelectDoctorViewController
        self.present(navigate, animated: true, completion: nil)
        
    }
    
    
    @IBAction func nextMonth(_ sender: Any) {
        calendar.setCurrentPage(getNextMonth(date: calendar.currentPage), animated: true)
        calendarView.addSubview(calendar)
        addButtons()
    }
    
    @IBAction func previousMonth(_ sender: Any) {
        calendar.setCurrentPage(getPreviousMonth(date: calendar.currentPage), animated: true)
        calendarView.addSubview(calendar)
        addButtons()
        
    }
    
    func getNextMonth(date: Date)-> Date{
        return Calendar.current.date(byAdding: .month, value: 1, to: date)!
    }
    
    func getPreviousMonth(date: Date)-> Date{
        return Calendar.current.date(byAdding: .month, value: -1, to: date)!
    }
    func addButtons(){
        calendarView.addSubview(previousMonth)
        calendarView.addSubview(nextMonth)
    }
    
    @IBAction func proceedButton(_ sender: Any) {
        if isSelectedTime == true && isSelectedDate == true && ComformAppointmentDetails.shared.time != [nil]{
            
            let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment4") as! SummaryViewController
            
            
            self.present(navigate, animated: true,  completion: nil)
        }
    }
    
    
}

extension DateTimeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.morningCollectioinView {
            return morningTime.count
        }
        return afternoonTime.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.morningCollectioinView{
            let cell = morningCollectioinView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! MorningTimeCollectionViewCell
            cell.layer.borderWidth = 1
            cell.layer.borderColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            cell.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
            cell.morningTime.text = morningTime[indexPath.row]
            
            return cell
        }
            
        else{
            let cell2 = afternoontimeCollectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! AfternoonTimeCollectionViewCell
            cell2.layer.borderWidth = 1
            cell2.layer.borderColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
            cell2.layer.masksToBounds = true
            cell2.layer.cornerRadius = 10
            cell2.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
            cell2.afternoonTime.text = afternoonTime[indexPath.row]
            return cell2
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isSelectedTime = true
        if(collectionView == morningCollectioinView){
            if let cell = morningCollectioinView.cellForItem(at: indexPath){
                cell.contentView.backgroundColor = DesignColor.shared.getUIColor(hex: "#B1BEB7")
                ComformAppointmentDetails.shared.time.append(morningTime[indexPath.row])
            }
        }
        else if (collectionView == afternoontimeCollectionView){
            if let cell2 = afternoontimeCollectionView.cellForItem(at: indexPath){
                ComformAppointmentDetails.shared.time.append(afternoonTime[indexPath.row])
                cell2.contentView.backgroundColor = DesignColor.shared.getUIColor(hex: "#B1BEB7")
                
            }
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if(collectionView == morningCollectioinView){
            if let cell = morningCollectioinView.cellForItem(at: indexPath){
                cell.contentView.backgroundColor = nil
                ComformAppointmentDetails.shared.time = ComformAppointmentDetails.shared.time.filter(){$0 != morningTime[indexPath.row]}
            }
        }
        else if (collectionView == afternoontimeCollectionView){
            if let cell2 = afternoontimeCollectionView.cellForItem(at: indexPath){
                cell2.contentView.backgroundColor = nil
                ComformAppointmentDetails.shared.time = ComformAppointmentDetails.shared.time.filter(){$0 != afternoonTime[indexPath.row]}
            }
            
        }
    }
    
    
    
    
}
//calendar functions
extension DateTimeViewController: FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance  {
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        
        
        let  dateString : String = dateformatter.string(from: date)
        
        if DoctorDetails.shared.busyDays.contains(dateString){
            return .gray
        }
        else{
            return nil
        }
        
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return DesignColor.shared.getUIColor(hex: "#BDBDBD")
        
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        
        
        let  dateString : String = dateformatter.string(from: date)
        
        if DoctorDetails.shared.busyDays.contains(dateString){
            return DesignColor.shared.getUIColor(hex: "#E5E7E9")
        }
        else{
            return nil
        }
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleSelectionColorFor date: Date) -> UIColor? {
        return .white
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        isSelectedDate = true
        selectedDate = dateformatter.string(from: date)
        let format = DateFormatter()
        format.dateFormat = "yyyy-mm-dd"
        let dateCalendar = Calendar.current
        
        let startDate = format.date(from: dateformatter.string(from: Date()))
        let enddate = format.date(from: selectedDate)
        let diffday = dateCalendar.dateComponents([.day], from: startDate!, to: enddate!).day
        let difftime = dateCalendar.dateComponents([.hour], from: startDate!, to: enddate!).hour
        let day = diffday!
        let time = difftime!
        ComformAppointmentDetails.shared.remainingTime = "in \(day) Day \(time) hours"
        
        self.date = date
        ComformAppointmentDetails.shared.date = selectedDate
    }
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    func maximumDate(for calendar: FSCalendar) -> Date {
        return Date().addingTimeInterval((24*60*60)*60)
    }
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        
        
        let  dateString : String = dateformatter.string(from: date)
        
        if DoctorDetails.shared.busyDays.contains(dateString){
            return false
        }
        else{
            return true
        }
    }
}

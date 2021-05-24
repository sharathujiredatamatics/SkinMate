//
//  MyAppointmentDateTimeViewController.swift
//  SkinMate
//
//  Created by techjini on 20/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
import FSCalendar

class MyAppointmentDateTimeViewController: UIViewController {
    
    @IBOutlet weak var calendarView: UIView!
    var calendar: FSCalendar!
    @IBOutlet weak var weekofDaysView: UIView!
    var isSelectedDate: Bool = false
    var selectedDate: String = "0000-00-00"
    @IBOutlet weak var nextMonth: UIButton!
    @IBOutlet weak var previousMonth: UIButton!
    var isSelectedTime: Bool = false
    
    @IBOutlet weak var morningTimeCollectionView: UICollectionView!
    
    @IBOutlet weak var eveningTimeCollectionViewController: UICollectionView!
    var morningTime: [String] = ["09:00","10:00","11:00"]
    var afternoonTime: [String] = ["15:00","16:00"]
    var eveningTime: [String] = ["18:00","19:00","20:00"]
    @IBOutlet weak var myafternoonTimeCollectionView: UICollectionView!
    @IBOutlet weak var proceedBtn: UIButton!
    var selectedIndexPath = IndexPath()
    fileprivate lazy var dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        let thickness: CGFloat = 1.0
        // calendar view design
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
        proceedBtn.alpha = 0.5
        morningTimeCollectionView.delegate = self
        myafternoonTimeCollectionView.delegate = self
        eveningTimeCollectionViewController.delegate = self
        proceedBtn.alpha = 0.5
        morningTimeCollectionView.allowsMultipleSelection = false
        myafternoonTimeCollectionView.allowsMultipleSelection = false
        eveningTimeCollectionViewController.allowsMultipleSelection = false
        morningTimeCollectionView.allowsSelection = true
    }
    // validate button
    func validateProceedButton(){
        if isSelectedDate == true && isSelectedTime == true {
            proceedBtn.alpha = 1
        }
    }
    // calendar next and previous month function
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
    // navigate to next view
    @IBAction func proccedButton(_ sender: UIButton) {
        if isSelectedTime == true && isSelectedDate == true {
            let navigate = storyboard?.instantiateViewController(withIdentifier: "RescheduleViewController") as! RescheduleViewController
            transitionFromRight()
            self.present(navigate, animated: false,  completion: nil)
        }
    }
    // back button
    @IBAction func backButton(_ sender: UIButton) {
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "allappointments"
        transitionFromLeft()
        self.present(mainTabController!, animated: false)
        
    }
}
//calendar functions
extension MyAppointmentDateTimeViewController: FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance  {
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
        validateProceedButton()
        calendar.appearance.todayColor = .clear
        calendar.appearance.titleTodayColor = .black
        selectedDate = dateformatter.string(from: date)
        // calcuulate the difference in date
        let format = DateFormatter()
        format.dateFormat = "yyyy-mm-dd"
        let dateCalendar = Calendar.current
        let startDate = format.date(from: dateformatter.string(from: Date()))
        let enddate = format.date(from: selectedDate)
        let diffday = dateCalendar.dateComponents([.day], from: startDate!, to: enddate!).day
        let difftime = dateCalendar.dateComponents([.hour], from: startDate!, to: enddate!).hour
        let day = diffday!
        let time = difftime!
        // assign the values
        ComformAppointmentDetails.shared.remainingTime = "in \(day) Day \(time) hours"
        ComformAppointmentDetails.shared.date = selectedDate
    }
    // maximum and minimum days visible in calendar
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
extension MyAppointmentDateTimeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.morningTimeCollectionView {
            return morningTime.count
        }
        else if collectionView == self.myafternoonTimeCollectionView {
            return afternoonTime.count
        }
        return eveningTime.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.morningTimeCollectionView{
            let cell = morningTimeCollectionView.dequeueReusableCell(withReuseIdentifier: "MyAppointmentMorningCollectionViewCell", for: indexPath) as! MyAppointmentMorningCollectionViewCell
            cell.layer.borderWidth = 1
            cell.layer.borderColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            cell.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
            cell.myappointMorningTime.text = morningTime[indexPath.row]
            
            return cell
        }
            
        else if collectionView == self.myafternoonTimeCollectionView {
            let cell2 = myafternoonTimeCollectionView.dequeueReusableCell(withReuseIdentifier: "MyAppointmentAfternoonCollectionViewCell", for: indexPath) as! MyAppointmentAfternoonCollectionViewCell
            cell2.layer.borderWidth = 1
            cell2.layer.borderColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
            cell2.layer.masksToBounds = true
            cell2.layer.cornerRadius = 10
            cell2.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
            cell2.afternoonTimeSlots.text = afternoonTime[indexPath.row]
            return cell2
        }
            
        else {
            let cell3 = eveningTimeCollectionViewController.dequeueReusableCell(withReuseIdentifier: "MyAppointmentEveningCollectionViewCell", for: indexPath) as! MyAppointmentEveningCollectionViewCell
            cell3.layer.borderWidth = 1
            cell3.layer.borderColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
            cell3.layer.masksToBounds = true
            cell3.layer.cornerRadius = 10
            cell3.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
            cell3.eveningTimeSlots.text = eveningTime[indexPath.row]
            return cell3
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        isSelectedTime = true
        validateProceedButton()
        // unhighlighting the previous cell
        if collectionView == morningTimeCollectionView{
            if let cell = morningTimeCollectionView.cellForItem(at: selectedIndexPath){
                cell.contentView.backgroundColor = .white
                
            }
        }
        if collectionView == myafternoonTimeCollectionView{
            if let cell = myafternoonTimeCollectionView.cellForItem(at: selectedIndexPath){
                cell.contentView.backgroundColor = .white
                
            }
        }
        if collectionView == eveningTimeCollectionViewController{
            if let cell = eveningTimeCollectionViewController.cellForItem(at: selectedIndexPath){
                cell.contentView.backgroundColor = .white
                
            }
        }
        
        // highlighting the selected cell
        if collectionView == morningTimeCollectionView{
            if let cell = morningTimeCollectionView.cellForItem(at: indexPath){
                cell.contentView.backgroundColor = DesignColor.shared.getUIColor(hex: "#B1BEB7")
                ComformAppointmentDetails.shared.time = morningTime[indexPath.row]
                myafternoonTimeCollectionView.allowsSelection = false
                eveningTimeCollectionViewController.allowsSelection = false
                selectedIndexPath = indexPath
            }
            
            
        }
        else if collectionView == myafternoonTimeCollectionView {
            if let cell2 = myafternoonTimeCollectionView.cellForItem(at: indexPath){
                cell2.contentView.backgroundColor = DesignColor.shared.getUIColor(hex: "#B1BEB7")
                ComformAppointmentDetails.shared.time = afternoonTime[indexPath.row]
                morningTimeCollectionView.allowsSelection = false
                eveningTimeCollectionViewController.allowsSelection = false
                selectedIndexPath = indexPath
                
            }
        }
        else if collectionView == eveningTimeCollectionViewController {
            if let cell3 = eveningTimeCollectionViewController.cellForItem(at: indexPath){
                cell3.contentView.backgroundColor = DesignColor.shared.getUIColor(hex: "#B1BEB7")
                ComformAppointmentDetails.shared.time = eveningTime[indexPath.row]
                morningTimeCollectionView.allowsSelection = false
                myafternoonTimeCollectionView.allowsSelection = false
                selectedIndexPath = indexPath
                
            }
        }
    }
}

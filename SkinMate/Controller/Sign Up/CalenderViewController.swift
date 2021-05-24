//
//  CalenderViewController.swift
//  SkinMate
//
//  Created by techjini on 20/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
import FSCalendar

protocol passData {
    func datePass(calDate: String)
}

class CalenderViewController: UIViewController,FSCalendarDelegate {
    
    @IBOutlet var calender: FSCalendar!
    var delegate: passData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calender.scrollDirection = .horizontal
        
        
        calender.delegate = self
        applyDessign()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = " dd MMM YYYY"
        let detail = formatter.string(from: date)
        print("\(detail)")
        delegate.datePass(calDate: detail)
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    func applyDessign() {
        calender.layer.masksToBounds = true
        calender.layer.cornerRadius = 40
        calender.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMinYCorner]
    }
    
}

//
//  ScheduleConfirmViewController.swift
//  BookAppointments
//
//  Created by techjini on 05/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//


import UIKit

class ScheduleConfirmViewController: UIViewController {
    
    @IBOutlet weak var serviceIdLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var doctorLabel: UILabel!
    @IBOutlet weak var scheduleDate: UILabel!
    @IBOutlet weak var scheduleTime: UILabel!

    @IBOutlet weak var dateTimeView: UIView!
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var serviceView: UIView!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
        let serviceBorder = CALayer()
        serviceBorder.frame = CGRect(x: 0, y: self.serviceView.frame.height - thickness, width: self.serviceView.frame.size.width, height: thickness)
        serviceBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        serviceView.layer.addSublayer(serviceBorder)

        let appointmentBorder = CALayer()
        appointmentBorder.frame = CGRect(x: 0, y: self.stackView.frame.height - thickness, width: self.stackView.frame.size.width, height: thickness)
        appointmentBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        stackView.layer.addSublayer(appointmentBorder)
        
        
        
        let stackBorder = CALayer()
        stackBorder.frame = CGRect(x: 0, y: self.stackView.frame.height - thickness, width: self.stackView.frame.size.width, height: thickness)
        stackBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        stackView.layer.addSublayer(stackBorder)
        
        let stackTopBorder = CALayer()
        stackTopBorder.frame = CGRect(x: 0, y: 0, width: self.stackView.frame.size.width, height: thickness)
        stackTopBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        stackView.layer.addSublayer(stackTopBorder)
        
        let dateBorder = CALayer()
           dateBorder.frame = CGRect(x: 0, y: self.dateTimeView.frame.height - thickness, width: self.dateTimeView.frame.size.width, height: thickness)
        dateBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        dateTimeView.layer.addSublayer(dateBorder)
        
        let dateTopBorder = CALayer()
        dateTopBorder.frame = CGRect(x: 0, y: 0, width: self.dateTimeView.frame.size.width, height: thickness)
        dateTopBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        dateTimeView.layer.addSublayer(dateTopBorder)
        
        serviceLabel.text = ComformAppointmentDetails.shared.service
        serviceIdLabel.text = ComformAppointmentDetails.shared.doctorid
        doctorLabel.text = ComformAppointmentDetails.shared.doctorname + "," + ComformAppointmentDetails.shared.doctorQualification
         scheduleDate.text = ComformAppointmentDetails.shared.date
         scheduleTime.text = ComformAppointmentDetails.shared.time[0]
           remainingTime.text = ComformAppointmentDetails.shared.remainingTime
    }
    
    
    @IBAction func scheduleConfirmButton(_ sender: Any) {
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "allappointments"
        self.present(mainTabController!, animated: true)
    }
  
    
    @IBAction func backButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment4") as! SummaryViewController
        self.present(navigate, animated: true, completion: nil)
        
    }
}

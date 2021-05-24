//
//  RescheduleConfirmViewController.swift
//  SkinMate
//
//  Created by techjini on 20/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class RescheduleConfirmViewController: UIViewController {
    
    @IBOutlet weak var scheduleAppointScrollView: UIScrollView!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var doctorLabel: UILabel!
    @IBOutlet weak var scheduleDate: UILabel!
    @IBOutlet weak var scheduleTime: UILabel!
    
    @IBOutlet weak var doctorId: UILabel!
    
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var serviceView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AllAppointments.shared.loadAllAppointments()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAppointmentViewTable"), object: nil)
        
        scheduleAppointScrollView.isScrollEnabled = true
        
        //view border design
        let thickness: CGFloat = 1.0
        let serviceBorder = CALayer()
        serviceBorder.frame = CGRect(x: 0, y: self.serviceView.frame.height - thickness, width: self.serviceView.frame.size.width, height: thickness)
        serviceBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        serviceView.layer.addSublayer(serviceBorder)
        
        let stackBorder = CALayer()
        stackBorder.frame = CGRect(x: 0, y: self.stackView.frame.height - thickness, width: self.stackView.frame.size.width, height: thickness)
        stackBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        stackView.layer.addSublayer(stackBorder)
        
        let stackTopBorder = CALayer()
        stackTopBorder.frame = CGRect(x: 0, y: 0, width: self.stackView.frame.size.width, height: thickness)
        stackTopBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        stackView.layer.addSublayer(stackTopBorder)
        
        
        // assign values to lables
        serviceLabel.text = "Medical"
        doctorId.text = ComformAppointmentDetails.shared.appointmentId
        doctorLabel.text = ComformAppointmentDetails.shared.doctorname + "," + ComformAppointmentDetails.shared.doctorQualification
        scheduleDate.text = ComformAppointmentDetails.shared.date
        scheduleTime.text = ComformAppointmentDetails.shared.time
        remainingTime.text = ComformAppointmentDetails.shared.remainingTime
        
    }
    
    
    // proceed button
    @IBAction func rescheduleButton(_ sender: UIButton) {
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "allappointments"
        transitionFromRight()
        self.present(mainTabController!, animated: false)
    }
    
    // back button
    @IBAction func backButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "MyAppointmentDateTimeViewController") as! MyAppointmentDateTimeViewController
        transitionFromLeft()
        self.present(navigate, animated: false, completion: nil)
        
    }
}





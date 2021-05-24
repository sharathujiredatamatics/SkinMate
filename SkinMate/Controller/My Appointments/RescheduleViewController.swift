//
//  RescheduleViewController.swift
//  SkinMate
//
//  Created by techjini on 20/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class RescheduleViewController: UIViewController {
    
    
    @IBOutlet weak var service: UILabel!
    
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var newDateandTime: UILabel!
    @IBOutlet weak var existingDateandTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // assign values to lables
        service.text = "Medical"
        newDateandTime.text = ComformAppointmentDetails.shared.date + "," + ComformAppointmentDetails.shared.time
        existingDateandTime.text = ComformAppointmentDetails.shared.existingdate + "," + ComformAppointmentDetails.shared.existingTime
        remainingTime.text = ComformAppointmentDetails.shared.remainingTime
    }
    // back button
    @IBAction func backButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "RescheduleViewController") as! RescheduleViewController
        transitionFromLeft()
        self.present(navigate, animated: false, completion: nil)
        
    }
    // proceed to next controller
    @IBAction func rescheduleButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "RescheduleConfirmViewController") as! RescheduleConfirmViewController
        transitionFromRight()
        PostRescheduleBookingAppoint.shared.bookingAppointmentReschedulePost()
        self.present(navigate, animated: false, completion: nil)
    }
    
}

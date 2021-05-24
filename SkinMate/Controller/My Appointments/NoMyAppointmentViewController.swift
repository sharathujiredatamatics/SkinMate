//
//  NoAppointmentViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Class showing no appointments and schedule a new appointments.
class NoMyAppointmentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    // Button function to load schedule appointments.
    @IBAction func scheduleAppointment(_ sender: UIButton) {
        transitionFromRight()
        let serviceViewController = UIStoryboard.init(name: "BookingAppointment", bundle: Bundle.main).instantiateViewController(withIdentifier: "appointment1") as? ServiceViewController
        self.present(serviceViewController!, animated: false, completion: nil)
    }
    
    
}

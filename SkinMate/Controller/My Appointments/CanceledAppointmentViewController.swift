//
//  CanceledAppointmentViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Cancelation succcess view controller class.
class CanceledAppointmentViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    var appointmentCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appointmentCount = AllAppointments.shared.allAppointments.count
        applyDesign()
        AllAppointments.shared.loadAllAppointments()
    }
    // Function to check if appointment is 0 or more and display the view accordingly.
    @IBAction func canceledAppointment(_ sender: UIButton) {
        if appointmentCount == 0{
            let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
            mainTabController?.viewId = "myappointments"
            self.present(mainTabController!, animated: false, completion: nil)
        }
        else{
            let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
            mainTabController?.viewId = "allappointments"
            self.present(mainTabController!, animated: false, completion: nil)
        }
    }
    
    func applyDesign() {
        containerView.layer.cornerRadius = 30
        containerView.layer.masksToBounds = true
        containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
    }
    
}

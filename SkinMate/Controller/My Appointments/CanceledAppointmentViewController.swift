//
//  CanceledAppointmentViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class CanceledAppointmentViewController: UIViewController {
     @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesign()
    }
    
    
    @IBAction func canceledAppointment(_ sender: UIButton) {
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "myappointmnet"
        self.present(mainTabController!, animated: true)
        
    }
  
    
    func applyDesign() {
        containerView.layer.cornerRadius = 30
        containerView.layer.masksToBounds = true
        containerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
    }

}

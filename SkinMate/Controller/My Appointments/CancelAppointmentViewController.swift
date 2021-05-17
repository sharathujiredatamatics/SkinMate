//
//  CancelAppointmentViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit



class CancelAppointmentViewController: UIViewController {

   
    @IBOutlet weak var cancelAppointment: UIView!
    
    
    @IBOutlet weak var appointmentCancel: UILabel!
    
    @IBOutlet weak var backButto: UIButton!
    
    @IBOutlet weak var cancelScrollView: UIScrollView!
    
    @IBOutlet weak var childView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var medicalView: UIView!
    
    @IBOutlet weak var lblId: UILabel!
    
    @IBOutlet weak var doctorName: UILabel!
    
    @IBOutlet weak var typeAppointment: UILabel!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var dateTime: UILabel!
    
    @IBOutlet weak var daysRemain: UILabel!
    
    var doctorId1 = String()
    var dateAndTime1 = String()
    var doctorNameId1 = String()
    
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblId.text = doctorId1
        dateTime.text = dateAndTime1
        doctorName.text = doctorNameId1
        backButto.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(alertView), for: .touchUpInside)
        
     
    }
    @objc func dismissView(){
        let allApointmentViewController =  self.storyboard?.instantiateViewController(withIdentifier: "AllApointmentViewController") as! AllApointmentViewController
        self.present(allApointmentViewController,animated: true)
    }
    @objc func alertView(){
          let canceled =  self.storyboard?.instantiateViewController(withIdentifier: "CanceledAppointmentViewController") as! CanceledAppointmentViewController
            self.present(canceled,animated: true)
    }
    

}

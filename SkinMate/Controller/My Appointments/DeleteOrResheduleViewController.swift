//
//  DeleteOrResheduleViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class DeleteOrResheduleViewController: UIViewController {
    @IBOutlet weak var deleteOrRescheduleView: UIView!
    @IBOutlet weak var dismissView: UIView!
    @IBOutlet weak var editAppointment: UIView!
    @IBOutlet weak var deleteAppointment: UIView!
    
    var doctorId = String()
    var dateAndTime = String()
    var doctorNameId = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.deleteOrRescheduleView.layer.masksToBounds = true
        self.deleteOrRescheduleView.layer.cornerRadius = 27
        self.deleteOrRescheduleView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
      
        gestureHandler()
    }
    // GestureHandler function to diss the View.
    func gestureHandler(){
        let hideGesture = UITapGestureRecognizer(target: self, action:  #selector(hideAction(sender:)))
        dismissView.isUserInteractionEnabled = true
        dismissView.addGestureRecognizer(hideGesture)
        
        let edit = UITapGestureRecognizer(target: self, action:  #selector(editAction(sender:)))
        editAppointment.isUserInteractionEnabled = true
        editAppointment.addGestureRecognizer(edit)
        
        let delete = UITapGestureRecognizer(target: self, action:  #selector(deleteAction(sender:)))
        deleteAppointment.isUserInteractionEnabled = true
        deleteAppointment.addGestureRecognizer(delete)
        
    }
    
    @objc func hideAction(sender : UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    @objc func editAction(sender : UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    @objc func deleteAction(sender : UITapGestureRecognizer) {
   
        let cancelAppointment = self.storyboard?.instantiateViewController(withIdentifier: "CancelAppointmentViewController") as? CancelAppointmentViewController
        cancelAppointment?.doctorId1 = doctorId
        cancelAppointment?.doctorNameId1 = doctorNameId
        cancelAppointment?.dateAndTime1 = dateAndTime
        
        self.present(cancelAppointment!,animated: true)
     
    }
    
    
    
}


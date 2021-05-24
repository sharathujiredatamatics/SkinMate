//
//  DeleteOrResheduleViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Class for managing to load cancelation view or reschedule view.
class DeleteOrResheduleViewController: UIViewController {
    @IBOutlet weak var deleteOrRescheduleView: UIView!
    @IBOutlet weak var dismissView: UIView!
    @IBOutlet weak var editAppointment: UIView!
    @IBOutlet weak var deleteAppointment: UIView!
    var date = String()
    var doctorId = String()
    var dateAndTime = String()
    var doctorNameId = String()
    var appointmentId = String()
    var nDate = Int()
    var index = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.deleteOrRescheduleView.layer.masksToBounds = true
        self.deleteOrRescheduleView.layer.cornerRadius = 27
        self.deleteOrRescheduleView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        getDiff()
        gestureHandler()
        NotificationCenter.default.addObserver(self, selector: #selector(loadDeleteView), name: NSNotification.Name(rawValue: "loadSuccessAppointmentDelete"), object: nil)
    }
    // Function to load cancelation view.
    @objc func loadDeleteView(notification: NSNotification){
        let cancelAppointment = self.storyboard?.instantiateViewController(withIdentifier: "CancelAppointmentViewController") as? CancelAppointmentViewController
        cancelAppointment?.doctorId1 = doctorId
        cancelAppointment?.doctorNameId1 = doctorNameId
        cancelAppointment?.dateAndTime1 = dateAndTime
        cancelAppointment?.appointmentId = appointmentId
        cancelAppointment?.date = "In \(nDate) Days"
        
        self.present(cancelAppointment!,animated: true)
    }
    // Tap Gesture handler functions.
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
    // Function to dismiss the view.
    @objc func hideAction(sender : UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    // Function to load reschedule view.
    @objc func editAction(sender : UITapGestureRecognizer) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "MyAppointmentDateTimeViewController") as! MyAppointmentDateTimeViewController
        transitionFromRight()
        self.present(navigate, animated: true)
    }
    // Function to load Cancelation view.
    @objc func deleteAction(sender : UITapGestureRecognizer) {
        let cancelAppointment = self.storyboard?.instantiateViewController(withIdentifier: "CancelAppointmentViewController") as? CancelAppointmentViewController
        cancelAppointment?.doctorId1 = doctorId
        cancelAppointment?.doctorNameId1 = doctorNameId
        cancelAppointment?.dateAndTime1 = dateAndTime
        cancelAppointment?.date = "In \(nDate) Days"
        cancelAppointment?.appointmentId = appointmentId
        cancelAppointment?.index = index
        self.present(cancelAppointment!,animated: true)
        
        
    }
    // Function to get difference between to dates.
    func getDiff(){
        var stringData = String()
        for value in date{
            if value == "."{
                stringData.append(":")
            }
            else{
                stringData.append(value)
            }
        }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss:mmZ"
        let nextDate = dateFormatter.date(from:stringData)!
        let tDate = Date()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss:mmZ"
        let diffComponents = Calendar.current.dateComponents([.hour], from: tDate, to: nextDate)
        let hours = diffComponents.hour
        nDate = (hours!/24)
    }
    
    
}


//
//  CancelAppointmentViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
//  Class for managing cancelation of appointment.
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
    var index = Int()
    var doctorId1 = String()
    var dateAndTime1 = String()
    var doctorNameId1 = String()
    var date = String()
    var appointmentId = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        lblId.text = doctorId1
        dateTime.text = dateAndTime1
        doctorName.text = doctorNameId1
        daysRemain.text = date
        backButto.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(alertView), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(loadSuccessView), name: NSNotification.Name(rawValue: "loadAppointmentViewControllerFromDeleteView"), object: nil)
    }
    // Function to load success view if cancelation is success.
    @objc func loadSuccessView(notification: NSNotification){
        let canceled =  self.storyboard?.instantiateViewController(withIdentifier: "CanceledAppointmentViewController") as! CanceledAppointmentViewController
        self.present(canceled,animated: false)
    }
    // Function go back to last view.
    @objc func dismissView(){
        transitionFromLeft()
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "allappointments"
        self.present(mainTabController!, animated: false)
    }
    // Function to load Cancel Appointment API Call.
    @objc func alertView(){
        CancelAppointment.shared.cancelAppointment(appointmentId: appointmentId , index : index)

    }
}

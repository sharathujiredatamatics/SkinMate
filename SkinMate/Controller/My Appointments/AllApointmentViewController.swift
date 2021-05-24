//
//  AllApointmentViewController.swift
//  SkinMate
//
//  Created by Datamatics on 12/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Class to manage Allpointments.
class AllApointmentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var lblMyAppointments: UILabel!
    @IBOutlet weak var appointmentTableView: UITableView!
    var  appointmentDate = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.appointmentTableView.reloadData()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(loadAppointmentView), name: NSNotification.Name(rawValue: "loadAppointmentViewTable"), object: nil)
        
    }
    // Function to reload all appointments.
    @objc func loadAppointmentView(notification: NSNotification){
        appointmentTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllAppointments.shared.allAppointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! AllApointmentsTableViewCell
        
        cell.appointId.text = "Id:  \( AllAppointments.shared.allAppointments[indexPath.row].appointmentid)"
        cell.infoDoctor.text = "\(AllAppointments.shared.allAppointments[indexPath.row].doctorName)    \(AllAppointments.shared.allAppointments[indexPath.row].doctorEducation)"
        
        var stringData = String()
        for value in AllAppointments.shared.allAppointments[indexPath.row].date{
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
        let dateOfBirth = dateFormatter.date(from:stringData)!
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dob = dateFormatter.string(from: dateOfBirth)
        appointmentDate.append(dob)
        cell.dateAppointment.text =  "\(dob)   \( AllAppointments.shared.allAppointments[indexPath.row].time)"
        cell.appointmentButton.addTarget(self, action: #selector(appointmentButtonTapped(_sender:)), for: .touchUpInside)
        cell.checkButton.addTarget(self, action: #selector(loadCheckIntPage(_sender:)), for: .touchUpInside)
        cell.callButton.addTarget(self, action: #selector(callPage(_sender:)), for: .touchUpInside)
        return cell
    }
    
    // Reschedulw or delete button taped action.
    @objc func appointmentButtonTapped(_sender: UIButton) {
        let MyAppointment = UIStoryboard.init(name: "MyAppointment", bundle: Bundle.main).instantiateViewController(withIdentifier: "DeleteOrResheduleViewController") as? DeleteOrResheduleViewController
        
        MyAppointment!.modalPresentationStyle = .overCurrentContext
        MyAppointment!.modalTransitionStyle = .crossDissolve
        // Getting the index path of tapped button.
        let hitPoint = _sender.convert(CGPoint.zero, to: appointmentTableView )
        if let indexPath = appointmentTableView.indexPathForRow(at: hitPoint) {
            MyAppointment?.index = indexPath.row
            MyAppointment?.appointmentId = AllAppointments.shared.allAppointments[indexPath.row].appointmentid
            MyAppointment?.doctorNameId = AllAppointments.shared.allAppointments[indexPath.row].doctorName
            MyAppointment?.dateAndTime = "\(appointmentDate[indexPath.row])  \(AllAppointments.shared.allAppointments[indexPath.row].time)"
            MyAppointment?.date = AllAppointments.shared.allAppointments[indexPath.row].date
            MyAppointment?.doctorId = AllAppointments.shared.allAppointments[indexPath.row].appointmentid
            ComformAppointmentDetails.shared.existingdate = AllAppointments.shared.allAppointments[indexPath.row].date
            ComformAppointmentDetails.shared.existingTime = AllAppointments.shared.allAppointments[indexPath.row].time
            //  ComformAppointmentDetails.shared.service =
            ComformAppointmentDetails.shared.appointmentId = AllAppointments.shared.allAppointments[indexPath.row].appointmentid
            ComformAppointmentDetails.shared.doctorname = AllAppointments.shared.allAppointments[indexPath.row].doctorName
            ComformAppointmentDetails.shared.doctorQualification = AllAppointments.shared.allAppointments[indexPath.row].doctorEducation
            
        }
        self.present(MyAppointment!, animated: true, completion: nil)
    }
    // Function to load checkin view.
    @objc func loadCheckIntPage(_sender: UIButton){
        let CheckInViewController = UIStoryboard.init(name: "CheckIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "CheckInViewController") as? CheckInViewController
        self.present(CheckInViewController!,animated: true,completion: nil)
    }
    // Function to load call view.
    @objc func callPage(_sender: UIButton){
        let CallViewController = UIStoryboard.init(name: "CheckIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "CallViewController") as? CallViewController
        
        self.present(CallViewController!,animated: true,completion: nil)
    }
    
}






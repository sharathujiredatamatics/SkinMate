//
//  AllApointmentViewController.swift
//  SkinMate
//
//  Created by Datamatics on 12/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class AllApointmentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    var results = [Appointments]()
    
   
    
    @IBOutlet weak var lblMyAppointments: UILabel!
    
   
    @IBOutlet weak var appointmentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        results = APICall.shared.getData()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! AllApointmentsTableViewCell
        
        cell.appointId.text = results[indexPath.row].appointmentid
        cell.infoDoctor.text = results[indexPath.row].doctorName + results[indexPath.row].doctorEducation
            cell.dateAppointment.text =  results[indexPath.row].date + results[indexPath.row].time
        cell.appointmentButton.addTarget(self, action: #selector(appointmentButtonTapped(_sender:)), for: .touchUpInside)
     
        
        
        return cell
    }
    
    
    @objc func appointmentButtonTapped(_sender: UIButton) {
        let MyAppointment = UIStoryboard.init(name: "MyAppointment", bundle: Bundle.main).instantiateViewController(withIdentifier: "DeleteOrResheduleViewController") as? DeleteOrResheduleViewController
   
        MyAppointment!.modalPresentationStyle = .overCurrentContext
        MyAppointment!.modalTransitionStyle = .crossDissolve
        let hitPoint = _sender.convert(CGPoint.zero, to: appointmentTableView )
        if let indexPath = appointmentTableView.indexPathForRow(at: hitPoint) {
     
           MyAppointment?.doctorNameId = results[indexPath.row].doctorName
            MyAppointment?.dateAndTime = results[indexPath.row].date + results[indexPath.row].time
            MyAppointment?.doctorId = results[indexPath.row].appointmentid
            
        }
        self.present(MyAppointment!, animated: true, completion: nil)
        }
    
  

}

    
    
    


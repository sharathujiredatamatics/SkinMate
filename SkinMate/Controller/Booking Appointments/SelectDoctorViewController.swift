//
//  SelectDoctorViewController.swift
//  BookAppointments
//
//  Created by techjini on 11/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit

class SelectDoctorViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    

    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var doctorTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // design to proceed Button
        proceedButton.backgroundColor = DesignColor.shared.getUIColor(hex: "#749BAD")
        
        proceedButton.tintColor = DesignColor.shared.getUIColor(hex: "#FFFFFF")
        proceedButton.alpha = 0.25
        proceedButton.isEnabled = false
        /*
        //back Button design
        backButton.layer.borderWidth = 1
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 7
        backButton.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        backButton.layer.borderColor = DesignColor.shared.getUIColor(hex: "#2122C")?.cgColor
 */
        doctorTableView.delegate = self
        doctorTableView.dataSource = self
        doctorTableView.addSubview(proceedButton)
      doctorTableView.tableFooterView = UIView()
        self.doctorTableView.reloadData()
    }
  

    @IBAction func backButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment1") as! ServiceViewController
        self.present(navigate, animated: true, completion: nil)
    }
    @IBAction func proceedButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment3") as! DateTimeViewController
            self.present(navigate, animated: true, completion: nil)
        
    }
}




extension SelectDoctorViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DoctorDetails.shared.id.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = doctorTableView.dequeueReusableCell(withIdentifier: "doctorcell", for: indexPath) as! DoctorSlectionTableViewCell
       
       
        cell.doctorName.text = DoctorDetails.shared.name[indexPath.row] + "," + DoctorDetails.shared.qualification[indexPath.row]
        cell.doctorImage.image = DoctorDetails.shared.doctorImages[indexPath.row]
        cell.doctorImage.layer.masksToBounds = true
        cell.doctorImage.layer.cornerRadius = cell.doctorImage.bounds.width / 2
 
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         proceedButton.alpha = 1
        proceedButton.isEnabled = true
        ComformAppointmentDetails.shared.doctorname = DoctorDetails.shared.name[indexPath.row]
        ComformAppointmentDetails.shared.doctorQualification = DoctorDetails.shared.qualification[indexPath.row]
        ComformAppointmentDetails.shared.doctorid = DoctorDetails.shared.id[indexPath.row]
        if let cell = doctorTableView.cellForRow(at: indexPath) as? DoctorSlectionTableViewCell{
            cell.showIcon()
        }
    
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         ComformAppointmentDetails.shared.doctorname = "nil"
         ComformAppointmentDetails.shared.doctorid = "nil"
        ComformAppointmentDetails.shared.doctorQualification = "nil"
        if let cell = doctorTableView.cellForRow(at: indexPath) as? DoctorSlectionTableViewCell{
            cell.hideIcon()
        }
        
    }

}

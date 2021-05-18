//
//  AppointFamilyMemberViewController.swift
//  BookAppointments
//
//  Created by techjini on 12/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit

class AppointFamilyMemberViewController: UIViewController {

    @IBOutlet weak var familyMemberTabelView: UITableView!
    
    @IBOutlet weak var addFamilyMemberButton: UIButton!
    var familyMembers: [String] = ["Self","Vinu"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = DesignColor.shared.getUIColor(hex: "#9E9E9E")
        addFamilyMemberButton.tintColor = DesignColor.shared.getUIColor(hex: "#749BAD")
        addFamilyMemberButton.backgroundColor = .white
       familyMemberTabelView.delegate = self
        familyMemberTabelView.dataSource = self
        familyMemberTabelView.layer.borderWidth = 1
        familyMemberTabelView.layer.borderColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        familyMemberTabelView.layer.masksToBounds = true
        familyMemberTabelView.layer.cornerRadius = 40
        familyMemberTabelView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
           familyMemberTabelView.tableFooterView = UIView()
        familyMemberTabelView.reloadData()
    }
    
    // add new family
    //take to the set up profile
    @IBAction func addNewFamilyMemberButton(_ sender: Any) {
    }
    
}
extension AppointFamilyMemberViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return familyMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = familyMemberTabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookingFamilyMemberTableViewCell
        
        cell.familyMemberName.tintColor = DesignColor.shared.getUIColor(hex: "#112027")
        cell.familyMemberName.text = familyMembers[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        ComformAppointmentDetails.shared.appointmentfor = familyMembers[indexPath.row]
        let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment4") as! SummaryViewController
        self.present(navigate, animated: true, completion: nil)
    }
    
    
}

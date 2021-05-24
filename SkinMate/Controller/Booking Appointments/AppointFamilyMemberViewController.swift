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
    
    var delegate: FamilyMemberDataPass!
    
    @IBOutlet weak var addFamilyMemberButton: UIButton!
    //  var familyMembers: [String] = ["Self","Vinu"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button design
        addFamilyMemberButton.tintColor = DesignColor.shared.getUIColor(hex: "#749BAD")
        addFamilyMemberButton.backgroundColor = .white
        
        familyMemberTabelView.delegate = self
        familyMemberTabelView.dataSource = self
        
        // tabelView design
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
        //        let mainTabController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Setup") as? SetProfileViewController
        //        BookingAppointmentViewId.shared.addfamilyViewId = "AddfamilyMember"
        //        transitionFromRight()
        //        // navigationController?.pushViewController(mainTabController!, animated: false)
        //        self.present(mainTabController!, animated: false)
        //
    }
}

//table functions
extension AppointFamilyMemberViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InsuranceDetails.shared.familyMembers.count //familyMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = familyMemberTabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookingFamilyMemberTableViewCell
        // color for cell label
        cell.familyMemberName.tintColor = DesignColor.shared.getUIColor(hex: "#112027")
        cell.familyMemberName.text = InsuranceDetails.shared.familyMembers[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ComformAppointmentDetails.shared.appointmentfor = InsuranceDetails.shared.familyMembers[indexPath.row]
        let personName = InsuranceDetails.shared.familyMembers[indexPath.row]
        //delegate to assign data
        delegate.familyMemberPassing(name: personName)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}

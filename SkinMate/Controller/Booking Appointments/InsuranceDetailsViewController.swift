//
//  InsuranceDetailsViewController.swift
//  SkinMate
//
//  Created by techjini on 20/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class InsuranceDetailsViewController: UIViewController {
    
    @IBOutlet weak var insuranceTabelView: UITableView!
    var delegate: FamilyMemberDataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        insuranceTabelView.delegate = self
        insuranceTabelView.dataSource = self
        // table view design
        insuranceTabelView.layer.borderWidth = 1
        insuranceTabelView.layer.borderColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        insuranceTabelView.layer.masksToBounds = true
        insuranceTabelView.layer.cornerRadius = 40
        insuranceTabelView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        insuranceTabelView.tableFooterView = UIView()
        insuranceTabelView.reloadData()
        
        
    }
    
}
extension InsuranceDetailsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InsuranceDetails.shared.insurances.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = insuranceTabelView.dequeueReusableCell(withIdentifier: "insuranceCell", for: indexPath) as! InsuranceTabelViewCell
        //color for cell lable
        cell.insurancesLabel.tintColor = DesignColor.shared.getUIColor(hex: "#112027")
        cell.insurancesLabel.text = InsuranceDetails.shared.insurances[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ComformAppointmentDetails.shared.insuranceInfo = InsuranceDetails.shared.insurances[indexPath.row]
        //delegate to assign data
        delegate.insuranceInformation(Id: InsuranceDetails.shared.insurances[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

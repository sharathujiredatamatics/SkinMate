//
//  FamilyViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class FamilyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var familyTableView: UITableView!
    @IBOutlet weak var backToMain: UIButton!
    @IBOutlet weak var addMember: UIButton!
    var viewControllerId = "familyview"
    @IBOutlet weak var familyTable: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        familyTableView.reloadData()
        familyTableView.tableFooterView = UIView()
        NotificationCenter.default.addObserver(self, selector: #selector(loadFamilyView), name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
    }
    @objc func loadFamilyView(notification: NSNotification){
        familyTableView.reloadData()
    }
    
    @IBAction func addFamilyMember(_ sender: UIButton) {
        let addFamilyMemberViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddFamilyMemberViewController") as? AddFamilyMemberViewController
        self.present(addFamilyMemberViewController!, animated: true)
    }
    @IBAction func backToMain(_ sender: UIButton) {
        DispatchQueue.main.async {
            FamilyMembers.shared.familyMembersData = []
        }
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "account"
        self.present(mainTabController!, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FamilyMembers.shared.familyMembersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FamilyMemberTableViewCell
        
        cell.memberName.text = "\(FamilyMembers.shared.familyMembersData[indexPath.row].firstName)   \(FamilyMembers.shared.familyMembersData[indexPath.row].lastName)"
        
        cell.memberImage.image = UIImage(named: FamilyMembers.shared.familyImages[indexPath.row])
        cell.updateOrDeleteMember.addTarget(self, action: #selector(updateOrDeleteTapped(_:)), for: .touchUpInside)
        return cell
    }
    @objc func updateOrDeleteTapped(_ sender: UIButton){
        let familyDeleteViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "FamilyDeleteViewController") as? FamilyDeleteViewController
        familyDeleteViewController!.modalPresentationStyle = .overCurrentContext
        familyDeleteViewController!.modalTransitionStyle = .crossDissolve
        
        let hitPoint = sender.convert(CGPoint.zero, to: familyTableView)
        if let indexPath = familyTableView.indexPathForRow(at: hitPoint) {
            familyDeleteViewController?.userId = FamilyMembers.shared.familyMembersData[indexPath.row]._id
            familyDeleteViewController?.userName = "\(FamilyMembers.shared.familyMembersData[indexPath.row].firstName)  \(FamilyMembers.shared.familyMembersData[indexPath.row].lastName)"
        }
        self.present(familyDeleteViewController!, animated: true, completion: nil)
    }
}

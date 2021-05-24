//
//  FamilyViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Class that manages all the actions of a Family ViewController like update and delete.
class FamilyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RefreshDataDelegate{
    @IBOutlet weak var familyTableView: UITableView!
    @IBOutlet weak var backToMain: UIButton!
    @IBOutlet weak var addMember: UIButton!
    var viewControllerId = "familyview"
    @IBOutlet weak var familyTable: NSLayoutConstraint!
    
    @IBOutlet weak var familyDetails: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            let vc = DeleteConformationViewController()
            vc.viewDelegate = self
            self.familyTableView.reloadData()
            self.familyTableView.beginUpdates()
            self.familyTableView.endUpdates()
        }
        familyTableView.tableFooterView = UIView()
        NotificationCenter.default.addObserver(self, selector: #selector(loadFamilyView), name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
        if FamilyMembers.shared.familyMembersData.count == 0{
            familyDetails.text = "No Family Members Found"
            
        }
    }
    func refreshData() {
        self.familyTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.familyTableView.reloadData()
        self.familyTableView.reloadData()
        self.familyTableView.beginUpdates()
        self.familyTableView.endUpdates()
    }
    // Function to load family table view.
    @objc func loadFamilyView(notification: NSNotification){
        self.familyTableView.reloadData()
    }
    // Button function to add a family member.
    @IBAction func addFamilyMember(_ sender: UIButton) {
        let addFamilyMemberViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddFamilyMemberViewController") as? AddFamilyMemberViewController
        self.present(addFamilyMemberViewController!, animated: true)
    }
    // Button function to go to last view.
    @IBAction func backToMain(_ sender: UIButton) {
        FamilyMembers.shared.familyMembersData.removeAll()
        FamilyMembers.shared.familyMembersData.removeAll()
        transitionFromLeft()
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "account"
        self.present(mainTabController!, animated: false)
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
    // Function to display Family edit or delete view.
    @objc func updateOrDeleteTapped(_ sender: UIButton){
        let familyDeleteViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "FamilyDeleteViewController") as? FamilyDeleteViewController
        familyDeleteViewController!.modalPresentationStyle = .overCurrentContext
        familyDeleteViewController!.modalTransitionStyle = .crossDissolve
        
        // Getting the current tapped index path of a table view.
        let hitPoint = sender.convert(CGPoint.zero, to: familyTableView)
        if let indexPath = familyTableView.indexPathForRow(at: hitPoint) {
            familyDeleteViewController?.index = indexPath.row
            familyDeleteViewController?.userId = FamilyMembers.shared.familyMembersData[indexPath.row]._id
            familyDeleteViewController?.userName = "\(FamilyMembers.shared.familyMembersData[indexPath.row].firstName)  \(FamilyMembers.shared.familyMembersData[indexPath.row].lastName)"
        }
        self.present(familyDeleteViewController!, animated: true, completion: nil)
    }
}

//
//  DeleteConformationViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
protocol RefreshDataDelegate{
    func refreshData()
}
// Class that confirms the action of user to delete family member or not.
class DeleteConformationViewController: UIViewController {
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var noConfoimation: UIButton!
    @IBOutlet weak var yesConfirmation: UIButton!
    @IBOutlet weak var memberName: UILabel!
    var viewDelegate: RefreshDataDelegate?
    var userId = String()
    var userName = String()
    var index = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        memberName.text = userName
        ContainerView.layer.cornerRadius = 30
        ContainerView.layer.masksToBounds = true
        ContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        NotificationCenter.default.addObserver(self, selector: #selector(loadFamilyView), name: NSNotification.Name(rawValue: "loadFamilyViewControllerFromDeleteView"), object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.viewDelegate?.refreshData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.viewDelegate?.refreshData()
        
    }
    // Function to load Family View from delete view.
    @objc func loadFamilyView(notification: NSNotification){
        self.viewDelegate?.refreshData()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
        let familyViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "FamilyViewController") as? FamilyViewController
        self.present(familyViewController!, animated: true, completion: nil)
    }
    // Button action to confirm no for delete action.
    @IBAction func noConfirmationAction(_ sender: Any) {
        let familyViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "FamilyViewController") as? FamilyViewController
        self.present(familyViewController!, animated: true, completion: nil)
    }
    // Button function to confirm yes for delete action.
    @IBAction func yseConfirmationAction(_ sender: UIButton) {
        DeleteFamilyMember.shared.deleteFamilyMember(id: userId, index : index)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
    }
}

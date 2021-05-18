//
//  FamilyDeleteViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class FamilyDeleteViewController: UIViewController {
    @IBOutlet weak var familyDeleteView: UIView!
    @IBOutlet weak var dismissView: UIView!
    @IBOutlet weak var editMember: UIView!
    @IBOutlet weak var deleteMember: UIView!
    var userId = String()
    var userName = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        MemberInformation.shared.memberInformation(id: userId)
        self.familyDeleteView.layer.masksToBounds = true
        self.familyDeleteView.layer.cornerRadius = 30
        self.familyDeleteView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
gestureHandler()
    }


    // GestureHandler function to diss the View.
    func gestureHandler(){
        let hideGesture = UITapGestureRecognizer(target: self, action:  #selector(self.hideAction))
        self.dismissView.addGestureRecognizer(hideGesture)
        
        let edit = UITapGestureRecognizer(target: self, action:  #selector(self.editAction))
        self.editMember.addGestureRecognizer(edit)
        
        let delete = UITapGestureRecognizer(target: self, action:  #selector(self.deleteAction))
        self.deleteMember.addGestureRecognizer(delete)
        
    }
    
    @objc func hideAction(sender : UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    @objc func editAction(sender : UITapGestureRecognizer) {
        let editFamilyMemberViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "EditFamilyMemberViewController") as? EditFamilyMemberViewController
        self.present(editFamilyMemberViewController!, animated: true, completion: nil)
    }
    @objc func deleteAction(sender : UITapGestureRecognizer) {
        let deleteConformationViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "DeleteConformationViewController") as? DeleteConformationViewController
        deleteConformationViewController?.userId = userId
        deleteConformationViewController?.userName = userName
        self.present(deleteConformationViewController!, animated: true, completion: nil)
       
    }
}

//}
//@IBOutlet weak var filterTableViewHeight: NSLayoutConstraint!
//override func viewDidLoad() {
//    super.viewDidLoad()
//    gestureHandler()
//}
//override func viewWillLayoutSubviews() {
//    super.updateViewConstraints()
//    self.filterTableViewHeight?.constant =

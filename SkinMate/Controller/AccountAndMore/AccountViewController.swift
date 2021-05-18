//
//  AccountViewController.swift
//  SkinMate
//
//  Created by Datamatics on 28/04/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var familyMember: UIView!
    
    @IBOutlet weak var addInsurance: UIView!
    @IBOutlet weak var touchId: UISwitch!
    @IBOutlet weak var changePassword: UIView!
    @IBOutlet weak var privacyPolicy: UIView!
    @IBOutlet weak var termsAndCondition: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    var imagePicker = UIImagePickerController()
    var viewControllerId = "acccountfamilyview"
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            userName.text = "\(UserDetails.shared.firstName) \(UserDetails.shared.lastName)"
                FamilyMembers.shared.familyMembersData = []
                FamilyMembers.shared.loadAllFamilyMembers()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
        }
        gestureHandler()
    }
    // GestureHandler function to diss the View.
    func gestureHandler(){
        let viewUser = UITapGestureRecognizer(target: self, action:  #selector(self.viewUserAction))
        self.viewProfile.addGestureRecognizer(viewUser)
        
        let viewFamily = UITapGestureRecognizer(target: self, action:  #selector(self.viewFamilyAction))
        self.familyMember.addGestureRecognizer(viewFamily)
        
        let addInsurance = UITapGestureRecognizer(target: self, action:  #selector(self.addInsuranceAction))
        self.addInsurance.addGestureRecognizer(addInsurance)
        
        let changePassword = UITapGestureRecognizer(target: self, action:  #selector(self.changePasswordAction))
        self.changePassword.addGestureRecognizer(changePassword)
        
        let privacyPolicy = UITapGestureRecognizer(target: self, action:  #selector(self.privacyPolicyAction))
        self.privacyPolicy.addGestureRecognizer(privacyPolicy)
        
        let termsAndCondition = UITapGestureRecognizer(target: self, action:  #selector(self.termsAndConditionAction))
        self.termsAndCondition.addGestureRecognizer(termsAndCondition)
        
        let profilePic = UITapGestureRecognizer(target: self, action:  #selector(self.profilePicAction))
        self.profilePic.addGestureRecognizer(profilePic)
        
    }
    
    @objc func viewUserAction(sender : UITapGestureRecognizer) {
        let userUpdateViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserUpdateViewController") as? UserUpdateViewController
        self.present(userUpdateViewController!, animated: true, completion: nil)
    }
    @objc func viewFamilyAction(sender : UITapGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
        let familyViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "FamilyViewController") as? FamilyViewController
        self.present(familyViewController!, animated: true, completion: nil)
    }
    @objc func addInsuranceAction(sender : UITapGestureRecognizer) {
        let addInsuranceViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddInsuranceViewController") as? AddInsuranceViewController
        self.present(addInsuranceViewController!, animated: true, completion: nil)
    }
    @objc func changePasswordAction(sender : UITapGestureRecognizer) {
        let changePasswordViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChangePasswordViewController") as? ChangePasswordViewController
        self.present(changePasswordViewController!, animated: true, completion: nil)
        
    }
    @objc func privacyPolicyAction(sender : UITapGestureRecognizer) {
        let privacyPolicyViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as? PrivacyPolicyViewController
        self.present(privacyPolicyViewController!, animated: true, completion: nil)
        
    }
    @objc func termsAndConditionAction(sender : UITapGestureRecognizer) {
        let termsAndConditionViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "TermsAndConditionViewController") as? TermsAndConditionViewController
        self.present(termsAndConditionViewController!, animated: true, completion: nil)
    }
    @objc func profilePicAction(sender : UITapGestureRecognizer) {
        uploadPicture()
    }
    @IBAction func tochIdAuthentication(_ sender: UISwitch) {
    }
    @IBAction func logout(_ sender: UIButton) {
        logoutUser()
//        let storyBoard:UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
//        
//        let signInViewController = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
//        
//        self.present(signInViewController, animated: true)
    }
}

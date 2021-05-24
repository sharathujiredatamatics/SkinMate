//
//  AccountViewController.swift
//  SkinMate
//
//  Created by Datamatics on 28/04/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Class to manage Account Section of a user.
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
    var selectedImage: UIImage!
    var viewControllerId = "acccountfamilyview"
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            AllAppointments.shared.loadAllAppointments()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAppointmentViewTable"), object: nil)
            // To check if touch id authenication enabled or not.
            let touchIdAuthenication = KeychainWrapper.standard.bool(forKey: "touchIdAction")
            let statusOfFingerPrint : Any? = KeychainWrapper.standard.bool(forKey: "touchIdAction")
            if((statusOfFingerPrint) != nil){
                if touchIdAuthenication == true{
                    self.touchId.isOn = true
                }
                else{
                    self.touchId.isOn = false
                }
            } else{
                self.touchId.isOn = false
            }
            self.profilePic.layer.masksToBounds = false
            
            FamilyMembers.shared.familyMembersData.removeAll()
            FamilyMembers.shared.loadAllFamilyMembers()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
        }
        gestureHandler()
    }
    // GestureHandler function.
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
    // Function to display user information page.
    @objc func viewUserAction(sender : UITapGestureRecognizer) {
        transitionFromRight()
        let userUpdateViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserUpdateViewController") as? UserUpdateViewController
        self.present(userUpdateViewController!, animated: true, completion: nil)
    }
    // Function to display family details view.
    @objc func viewFamilyAction(sender : UITapGestureRecognizer) {
        transitionFromRight()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
        let familyViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "FamilyViewController") as? FamilyViewController
        self.present(familyViewController!, animated: true, completion: nil)
    }
    // Function to display add insurance view.
    @objc func addInsuranceAction(sender : UITapGestureRecognizer) {
        transitionFromRight()
        let addInsuranceViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddInsuranceViewController") as? AddInsuranceViewController
        self.present(addInsuranceViewController!, animated: true, completion: nil)
    }
    // Function to display change password view.
    @objc func changePasswordAction(sender : UITapGestureRecognizer) {
        transitionFromRight()
        let changePasswordViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChangePasswordViewController") as? ChangePasswordViewController
        self.present(changePasswordViewController!, animated: true, completion: nil)
    }
    // Function to display privacy policy view.
    @objc func privacyPolicyAction(sender : UITapGestureRecognizer) {
        transitionFromRight()
        let privacyPolicyViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "PrivacyPolicyViewController") as? PrivacyPolicyViewController
        self.present(privacyPolicyViewController!, animated: true, completion: nil)
    }
    // Function to display terms and condition view.
    @objc func termsAndConditionAction(sender : UITapGestureRecognizer) {
        transitionFromRight()
        let termsAndConditionViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "TermsAndConditionViewController") as? TermsAndConditionViewController
        self.present(termsAndConditionViewController!, animated: true, completion: nil)
    }
    // Function to change user profile picture.
    @objc func profilePicAction(sender : UITapGestureRecognizer) {
        uploadPicture()
    }
    // Switch function to enable or disable touch id authentication.
    @IBAction func tochIdAuthentication(_ sender: UISwitch) {
        if (sender.isOn == true){
            KeychainWrapper.standard.set(true, forKey: "touchIdAction")
        }
        else{
            KeychainWrapper.standard.set(false, forKey: "touchIdAction")
        }
    }
    // Button Function to logout user from the application.
    @IBAction func logout(_ sender: UIButton) {
        logoutUser()
    }
}

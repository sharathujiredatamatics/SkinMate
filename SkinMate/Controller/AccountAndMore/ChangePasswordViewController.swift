//
//  ChangePasswordViewController.swift
//  SkinMate
//
//  Created by Datamatics on 10/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Class to manage change password action.
class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var backToMain: UIButton!
    @IBOutlet weak var currentPassword: UITextField!
    @IBOutlet weak var errorCurrentPassword: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorPassword: UILabel!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var errorConfirmPassword: UILabel!
    @IBOutlet weak var changePasswordButton: UIButton!
    @objc let lookCurrentPassword = UIButton(type: .custom)
    @objc let lookPassword = UIButton(type: .custom)
    @objc let lookConfirmPassword = UIButton(type: .custom)
    var validPassword = false
    var currentPassswordState = true
    var passwordSate = true
    var confirmPasswordState = true
    var validConfimPassword = false
    var validCurrentPassword = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lookCurrentPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
        lookCurrentPassword.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 5)
        lookCurrentPassword.frame = CGRect(x: CGFloat(currentPassword.frame.size.width - 25), y: CGFloat(5), width: CGFloat(23), height: CGFloat(14))
        lookCurrentPassword.addTarget(self, action: #selector(self.lookCurrentPasswordAction), for: .touchUpInside)
        currentPassword.rightView = lookCurrentPassword
        currentPassword.rightViewMode = .always
        
        lookPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
        lookPassword.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 5)
        lookPassword.frame = CGRect(x: CGFloat(password.frame.size.width - 25), y: CGFloat(5), width: CGFloat(23), height: CGFloat(14))
        lookPassword.addTarget(self, action: #selector(self.lookPasswordAction), for: .touchUpInside)
        password.rightView = lookPassword
        password.rightViewMode = .always
        
        
        lookConfirmPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
        lookConfirmPassword.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 5)
        lookConfirmPassword.frame = CGRect(x: CGFloat(confirmPassword.frame.size.width - 25), y: CGFloat(5), width: CGFloat(23), height: CGFloat(14))
        lookConfirmPassword.addTarget(self, action: #selector(self.lookConfirmPasswordAction), for: .touchUpInside)
        confirmPassword.rightView = lookConfirmPassword
        confirmPassword.rightViewMode = .always
        NotificationCenter.default.addObserver(self, selector: #selector(loadPasswordUpdateViewController), name: NSNotification.Name(rawValue: "loadPasswordUpdateViewController"), object: nil)
    }
    // Function to load password changed success view from password change view.
    @objc func loadPasswordUpdateViewController(notification: NSNotification){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Account", bundle: nil)
        let successfullyUpdatedViewController = storyBoard.instantiateViewController(withIdentifier: "SuccessfullyUpdatedViewController") as! SuccessfullyUpdatedViewController
        successfullyUpdatedViewController.viewId = "passwordupdate"
        successfullyUpdatedViewController.message = "Password Changed Successfully"
        self.present(successfullyUpdatedViewController, animated: true)
        
    }
    // Functions to handle show or hide password.
    @objc func lookCurrentPasswordAction(sender: UIButton){
        if currentPassswordState == true{
            lookCurrentPassword.setImage(UIImage(named: "HidePassword"), for: .normal)
            currentPassword.isSecureTextEntry = false
            currentPassswordState = false
        }
        else if currentPassswordState == false{
            lookCurrentPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
            currentPassword.isSecureTextEntry = true
            currentPassswordState = true
        }
    }
    @objc func lookPasswordAction(sender: UIButton){
        if passwordSate == true{
            lookPassword.setImage(UIImage(named: "HidePassword"), for: .normal)
            password.isSecureTextEntry = false
            passwordSate = false
        }
        else if passwordSate == false{
            lookPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
            password.isSecureTextEntry = true
            passwordSate = true
        }
    }
    @objc func lookConfirmPasswordAction(sender: UIButton){
        if confirmPasswordState == true{
            lookConfirmPassword.setImage(UIImage(named: "HidePassword"), for: .normal)
            confirmPassword.isSecureTextEntry = false
            confirmPasswordState = false
        }
        else if confirmPasswordState == false{
            lookConfirmPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
            confirmPassword.isSecureTextEntry = true
            confirmPasswordState = true
        }
    }
    // TextField functions to handle did begin and did end actions of textfields.
    @IBAction func currernPasswordDidTypeChange(_ sender: UITextField) {
        checkCurrentPassword()
    }
    @IBAction func passwordDidTypeFinish(_ sender: UITextField) {
        checkPassword()
    }
    
    @IBAction func confirmPaswwordDidTypeFinish(_ sender: UITextField) {
        checkConfirmPassword()
    }
    @IBAction func currernPasswordDidTypeChangeEnd(_ sender: UITextField) {
        checkCurrentPasswordEnd()
    }
    @IBAction func passwordDidTypeFinishEnd(_ sender: UITextField) {
        checkPasswordEnd()
    }
    
    @IBAction func confirmPaswwordDidTypeFinishEnd(_ sender: UITextField) {
        checkConfirmPasswordEnd()
    }
    @IBAction func changePassword(_ sender: UIButton) {
        PasswordChange.shared.passwordChange(password: password.text!)
    }
    // Button function to go to last view.
    @IBAction func backButton(_ sender: UIButton) {
        transitionFromLeft()
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "account"
        self.present(mainTabController!, animated: false)
        
    }
}


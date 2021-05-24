//
//  SignInViewController.swift
//  SkinMate
//
//  Created by Datamatics on 30/04/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
import LocalAuthentication
// SignIn Class to manage all sign in actions.
class SignInViewController: UIViewController {
    @IBOutlet weak var signInPhoneNumberFiled: UITextField!
    @IBOutlet weak var phoneNumberError: UILabel!
    @IBOutlet weak var signInPasswordField: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var backToMain: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var fiingerPrintAuthentication: UIImageView!
    @objc let lookPassword = UIButton(type: .custom)
    var passwordSate = true
    var validUserId = false
    var validPassword = false
    var userIdPhone = String()
    var userIdEmail = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Checking touch id is enabled or disabled.
        let touchIdAuthenication = KeychainWrapper.standard.bool(forKey: "touchIdAction")
        let statusOfFingerPrint : Any? = KeychainWrapper.standard.bool(forKey: "touchIdAction")
        if((statusOfFingerPrint) != nil){
            if touchIdAuthenication == true{
                fiingerPrintAuthentication.image = UIImage(named: "FingerPrintActive")
            }
            else{
                fiingerPrintAuthentication.image = UIImage(named: "FingerPrintDisabled")
            }
        } else{
            fiingerPrintAuthentication.image = UIImage(named: "FingerPrintDisabled")
        }
        lookPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
        lookPassword.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 5)
        lookPassword.frame = CGRect(x: CGFloat(signInPasswordField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(23), height: CGFloat(14))
        lookPassword.addTarget(self, action: #selector(self.lookPasswordAction), for: .touchUpInside)
        signInPasswordField.rightView = lookPassword
        signInPasswordField.rightViewMode = .always
        NotificationCenter.default.addObserver(self, selector: #selector(loadVerifyEmailView), name: NSNotification.Name(rawValue: "loadVerifyEmailViewController"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadMainTabView), name: NSNotification.Name(rawValue: "loadMainTabViewController"), object: nil)
        let fingerPrintAuthentication = UITapGestureRecognizer(target: self, action:  #selector(self.fingerPrintAuthenticationAction))
        self.fiingerPrintAuthentication.addGestureRecognizer(fingerPrintAuthentication)
        
    }
    // Function for checking user id enabled or disabled.
    @objc func fingerPrintAuthenticationAction(sender : UITapGestureRecognizer) {
        let touchIdAuthenication = KeychainWrapper.standard.bool(forKey: "touchIdAction")
        let statusOfFingerPrint : Any? = KeychainWrapper.standard.bool(forKey: "touchIdAction")
        if((statusOfFingerPrint) != nil){
            if touchIdAuthenication == true{
                authenticate()
            }
            else{
                alert(tittle:"Alert", message: "FingerPrint Disabled By User")
            }
        } else{
            alert(tittle:"Alert", message: "FingerPrint Disabled By User")
        }
        
    }
    // TextFiled Function  to chech user deatils
    @IBAction func phoneNumberChanged(_ sender: UITextField) {
        checkUserId()
    }
    @IBAction func phoneNumberChangedEnd(_ sender: UITextField) {
        checkUserIdEnd()
    }
    @IBAction func passwordChanged(_ sender: UITextField) {
        checkPassword()
    }
    @IBAction func passwordChangedEnd(_ sender: UITextField) {
        checkPasswordEnd()
    }
    // Action of show password and hide password.
    @objc func lookPasswordAction(sender: UIButton){
        if passwordSate == true{
            lookPassword.setImage(UIImage(named: "HidePassword"), for: .normal)
            signInPasswordField.isSecureTextEntry = false
            passwordSate = false
        }
        else if passwordSate == false{
            lookPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
            signInPasswordField.isSecureTextEntry = true
            passwordSate = true
        }
    }
    // Function to load verify email viewcontroller.
    @objc func loadVerifyEmailView(notification: NSNotification){
        let verifyEmailViewController = UIStoryboard.init(name: "SignIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "VerifyEmailViewController") as? VerifyEmailViewController
        verifyEmailViewController?.number = "Your Email Id"
        present(verifyEmailViewController!, animated: false)
    }
    // Function to load Main Tab controller.
    @objc func loadMainTabView(notification: NSNotification){
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "home"
        present(mainTabController!, animated: true)
        
    }
    // Button function to go back to last view.
    @IBAction func backToMainButttton(_ sender: UIButton) {
        transitionFromLeft()
        let mainPage = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        present(mainPage!, animated: false)
    }
    // Button function to go to forgot password page.
    @IBAction func forgotPassword(_ sender: Any) {
        transitionFromRight()
        let forgotPasswordViewController = UIStoryboard.init(name: "ForgotPassword", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        present(forgotPasswordViewController!, animated: false)
        
    }
    // Button function to signin.
    @IBAction func signIn(_ sender: UIButton) {
        let password = self.signInPasswordField.text!
        checkPhoneOrEmail()
        signIn(userIdEmail: userIdEmail,userIdPhone: userIdPhone, password: password)
        
    }
    // Button function to go to signup page.
    @IBAction func signUp(_ sender: UIButton) {
        transitionFromRight()
        let signUp = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        present(signUp!, animated: false)
        
    }
    @IBAction func termsAndCondition(_ sender: UIButton) {
        
    }
    
}



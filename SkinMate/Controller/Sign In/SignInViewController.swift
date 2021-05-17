//
//  SignInViewController.swift
//  SkinMate
//
//  Created by Datamatics on 30/04/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInPhoneNumberFiled: UITextField!
    @IBOutlet weak var phoneNumberError: UILabel!
    @IBOutlet weak var signInPasswordField: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var backToMain: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @objc let lookPassword = UIButton(type: .custom)
    var passwordSate = true
    var validUserId = false
    var validPassword = false
    var userIdPhone = String()
    var userIdEmail = String()
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.backToMain.layer.masksToBounds = true
//        self.backToMain.layer.cornerRadius = 6
//        self.backToMain.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        lookPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
        lookPassword.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 5)
        lookPassword.frame = CGRect(x: CGFloat(signInPasswordField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(23), height: CGFloat(14))
        lookPassword.addTarget(self, action: #selector(self.lookPasswordAction), for: .touchUpInside)
        signInPasswordField.rightView = lookPassword
        signInPasswordField.rightViewMode = .always
        NotificationCenter.default.addObserver(self, selector: #selector(loadVerifyEmailView), name: NSNotification.Name(rawValue: "loadVerifyEmailViewController"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadMainTabView), name: NSNotification.Name(rawValue: "loadMainTabViewController"), object: nil)
    }
    
    @IBAction func phoneNumberChanged(_ sender: UITextField) {
        checkUserId()
    }
    @IBAction func passwordChanged(_ sender: UITextField) {
        checkPassword() 
    }
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
    @objc func loadVerifyEmailView(notification: NSNotification){
        let verifyEmailViewController = UIStoryboard.init(name: "SignIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "VerifyEmailViewController") as? VerifyEmailViewController
        verifyEmailViewController?.number = "Your Email"
        self.present(verifyEmailViewController!, animated: true, completion: nil)
    }
    
    @objc func loadMainTabView(notification: NSNotification){
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "home"
        self.present(mainTabController!, animated: true, completion: nil)
        
    }
    
    @IBAction func backToMainButttton(_ sender: UIButton) {
        let mainTab = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController    
        self.present(mainTab!, animated: true, completion: nil)
    }
    @IBAction func forgotPassword(_ sender: Any) {
        let forgotPasswordViewController = UIStoryboard.init(name: "ForgotPassword", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        self.present(forgotPasswordViewController!, animated: true, completion: nil)
        
    }
    @IBAction func signIn(_ sender: UIButton) {
        let password = self.signInPasswordField.text!
       
        checkPhoneOrEmail()
      
        signIn(userIdEmail: userIdEmail,userIdPhone: userIdPhone, password: password)
        
    }
    @IBAction func signUp(_ sender: UIButton) {
        let signUp = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        self.present(signUp!, animated: true, completion: nil)
        
    }
    @IBAction func termsAndCondition(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.present(vc!, animated: true, completion: nil)
    }
    
}



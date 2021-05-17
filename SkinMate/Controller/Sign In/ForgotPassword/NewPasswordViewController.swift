//
//  NewPasswordViewController.swift
//  SkinMate
//
//  Created by Datamatics on 05/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class NewPasswordViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorPassword: UILabel!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var errorConfirmPassword: UILabel!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var backToMain: UIButton!
    @objc let lookPassword = UIButton(type: .custom)
    @objc let lookConfirmPassword = UIButton(type: .custom)
    var validPassword = false
    var passwordSate = true
    var confirmPasswordState = true
    var validConfimPassword = false
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    @objc func lookPasswordAction(sender: UIButton){
        if passwordSate == true{
            lookPassword.setImage(UIImage(named: "HidePassword"), for: .normal)
            password.isSecureTextEntry = false
            passwordSate = false
        }
        else if passwordSate == false{
            lookPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
            confirmPassword.isSecureTextEntry = true
            passwordSate = true
        }
    }
    @objc func lookConfirmPasswordAction(sender: UIButton){
        if confirmPasswordState == true{
            lookConfirmPassword.setImage(UIImage(named: "HidePassword"), for: .normal)
            password.isSecureTextEntry = false
            confirmPasswordState = false
        }
        else if confirmPasswordState == false{
            lookConfirmPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
            confirmPassword.isSecureTextEntry = true
            confirmPasswordState = true
        }
    }
    
    @IBAction func passwordDidTypeFinish(_ sender: UITextField) {
        checkPassword()
    }
    
    @IBAction func confirmPaswwordDidTypeFinish(_ sender: UITextField) {
        checkConfirmPassword()
    }
    @IBAction func changePassword(_ sender: UIButton) {
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        let forgotPasswordViewController = UIStoryboard.init(name: "SignIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        self.present(forgotPasswordViewController!, animated: true, completion: nil)
        
    }
}

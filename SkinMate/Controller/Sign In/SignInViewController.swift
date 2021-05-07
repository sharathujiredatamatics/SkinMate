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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backToMain.layer.masksToBounds = true
        self.backToMain.layer.cornerRadius = 6
        self.backToMain.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        lookPassword.setImage(UIImage(named: "ShowPassword"), for: .normal)
        lookPassword.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 5)
        lookPassword.frame = CGRect(x: CGFloat(signInPasswordField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(23), height: CGFloat(14))
        lookPassword.addTarget(self, action: #selector(self.lookPasswordAction), for: .touchUpInside)
        signInPasswordField.rightView = lookPassword
        signInPasswordField.rightViewMode = .always
    }
    
    @IBAction func phoneNumberChanged(_ sender: UITextField) {
        checkUserId()
        if validUserId == true{
            phoneNumberError.text = " "
        }
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
    @IBAction func backToMainButttton(_ sender: UIButton) {
    }
    @IBAction func forgotPassword(_ sender: Any) {
        let forgotPasswordViewController = UIStoryboard.init(name: "SignIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        self.present(forgotPasswordViewController!, animated: true, completion: nil)
        
    }
    @IBAction func signIn(_ sender: UIButton) {
           guard let userId = self.signInPhoneNumberFiled.text else { return }
        guard let password = self.signInPasswordField.text else { return }
        
        if let url = URL(string: "https://skinmate.herokuapp.com/accounts/auth"){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let parameters: [String : Any] = [
                "email": userId,
                "phone": userId,
                "password": password
            ]
            
            request.httpBody = parameters.percentEscaped().data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    guard (400 ... 500) ~= response.statusCode else {
                        let statusCode = response.statusCode
                        print("Status code :- \(statusCode)")
                        print(response)
                        
                        
                        if statusCode == 403{
                            self.alert(tittle: "Alert", message: " Requires user-agent")
                        }
                        else if statusCode == 404{
                            self.passwordError.text = "Account not found"
                        }
                        else if statusCode == 500{
                            self.passwordError.text = "Couldn't verify password"
                        }
                        else if statusCode == 401{
                            self.passwordError.text = "Incorrect password"
                        }
                        else if statusCode == 500{
                            self.passwordError.text = "Couldn't authenticate"
                        }
                        else{
                            let mainTab = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
                            self.present(mainTab!, animated: true, completion: nil)
                        }
                        
                        return
                    }
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
    @IBAction func signUp(_ sender: UIButton) {
        let signUp = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUp") as? SignupViewController
        self.present(signUp!, animated: true, completion: nil)
        
    }
    @IBAction func termsAndCondition(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.present(vc!, animated: true, completion: nil)
    }
    
}

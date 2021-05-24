//
//  SignupViewController.swift
//  DermitologyApplication
//
//  Created by techjini on 21/04/21.
//  Copyright © 2021 techjini. All rights reserved.
//
import Foundation
import UIKit

class SignupViewController: UIViewController, UIViewControllerTransitioningDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var SignScroll: UIScrollView!
    
    @IBOutlet weak var ContainerView1: UIView!
    
    @IBOutlet weak var NavBarView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var lblSignUp: UILabel!
    
    @IBOutlet weak var infoStack: UIStackView!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblPassword: UILabel!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblConfirm: UILabel!
    
    @IBOutlet weak var txtConfirm: UITextField!
    
    @IBOutlet weak var lblPhoneError: UILabel!
    
    
    @IBOutlet weak var lblEmailError: UILabel!
    
    
    @IBOutlet weak var lblPassError: UILabel!
    
    @IBOutlet weak var lblConfirmError: UILabel!
    
    
    @IBOutlet weak var btnProceed: UIButton!
    
    
    var validPhone = false
    var validEmail = false
    var validPass = false
    var validConPass = false
    
    
    
    var iconClick = false
    //let imageIcon = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesign()
        btnProceed.addTarget(self, action: #selector(proceed), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    
    
    //MARK:- Hiding navigationbar from first view controller.
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    
    //MARK:- Popping view controller
    @IBAction func Back(_ sender: UIButton) {
        transitionFromLeft()
        self.navigationController?.popViewController(animated: false)
    }
    
    
    
    //MARK:- Securing text entry on eye button click for entering Password.
    func setIcon1(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 0, y: 0, width: 23, height: 14))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: -10, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        
        
        txtPassword.rightView = iconContainerView
        txtPassword.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(iconClicked1(tapGestureRecognizer:)))
        iconView.isUserInteractionEnabled = true
        iconView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    @objc func iconClicked1(tapGestureRecognizer: UITapGestureRecognizer){
        //  let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if(iconClick == true) {
            txtPassword.isSecureTextEntry = false
            setIcon1(UIImage(named: "HidePassword")!)
            
        } else {
            txtPassword.isSecureTextEntry = true
            setIcon1(UIImage(named: "ShowPassword")!)
        }
        
        iconClick = !iconClick
    }
    
    //MARK:- Securing text entry on eye button click for confirming Password.
    
    
    func setIcon2(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 0, y: 0, width: 23, height: 14))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: -10, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        
        
        
        
        txtConfirm.rightView = iconContainerView
        txtConfirm.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(iconClicked2(tapGestureRecognizer:)))
        iconView.isUserInteractionEnabled = true
        iconView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func iconClicked2(tapGestureRecognizer: UITapGestureRecognizer){
        //  let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if(iconClick == true) {
            txtConfirm.isSecureTextEntry = false
            setIcon2(UIImage(named: "HidePassword")!)
        } else {
            txtConfirm.isSecureTextEntry = true
            setIcon2(UIImage(named: "ShowPassword")!)
        }
        
        iconClick = !iconClick
    }
    
    
    //MARK:- Customizing text fields.
    
    func applyDesign() {
        
        setIcon1(UIImage(named: "ShowPassword")!)
        setIcon2(UIImage(named: "ShowPassword")!)
        txtConfirm.textColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 1)
        txtPassword.textColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 1)
        
        txtPassword.tintColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        txtConfirm.tintColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        txtPhone.tintColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        txtEmail.tintColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
    }
    
    
    
    // textField validation.
    
    
    @IBAction func phoneChanged(_ sender: UITextField) {
        checkPhone()
    }
    
    
    
    @IBAction func emailChange(_ sender: UITextField) {
        checkEmail()
    }
    
    
    
    @IBAction func passChanged(_ sender: UITextField) {
        checkPass()
    }
    
    
    
    @IBAction func confirmChamge(_ sender: UITextField) {
        confirmPass()
    }
    
    
    
    @objc func proceed() {
        
        let pass: String = txtPassword.text!
        print(pass)
        print(txtPhone.text!)
        print(txtEmail.text!)
        print(txtConfirm.text!)
        
        setupPostMethod(PhoneNo: txtPhone.text!, Email: txtEmail.text!, Password: txtConfirm.text!)
        
        
        
        
    }
    
    
    
    
    func setupPostMethod(PhoneNo: String,Email: String,Password: String){
        var parameters = String()
        parameters = "email=\(Email)&password=\(Password)&phone=\(PhoneNo)"
        
        
        // https://jsonplaceholder.typicode.com/posts/
        if let url = URL(string: "https://skinmate.herokuapp.com/accounts"){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = parameters.data(using: String.Encoding.utf8)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    if response.statusCode == 409 {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Alert", message: "Account Created Already \n Please SignIn", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action: UIAlertAction!) in
                                print("Okay")
                                let storyBoard:UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
                                self.transitionFromRight()
                                let signInVC: SignInViewController = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                                self.present(signInVC, animated: true, completion: nil)
                            }))
                            self.present(alert,animated: true,completion: nil)
                        }
                        
                    }
                    else if response.statusCode == 406 {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Alert", message: "Validation error", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action: UIAlertAction!) in
                                print("Okay")
                                
                            }))
                            self.present(alert,animated: true,completion: nil)
                            
                        }
                        
                    }
                    else if response.statusCode == 500 {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Alert", message: "Could not register", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action: UIAlertAction!) in
                                print("Okay")
                                
                            }))
                            self.transitionFromRight()
                            self.present(alert,animated: false,completion: nil)
                        }
                        
                    } else {
                        DispatchQueue.main.async {
                            
                            let sec: OtpEnterViewController = self.storyboard?.instantiateViewController(withIdentifier: "OtpEnterViewController") as! OtpEnterViewController
                            self.transitionFromRight()
                            sec.self.text = self.txtPhone.text!
                            sec.modalPresentationStyle = .overCurrentContext
                            sec.modalTransitionStyle = .crossDissolve
                            self.present(sec,animated: false)
                        }
                    }
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    print(json!)
                    
                    print(" device Id: \(json!["_id"]!)")
                    print(" token ID: \(json!["token"]!)")
                    SystemVerification.shared.deviceId = "\(json!["_id"]!)"
                    SystemVerification.shared.tokenId = "\(json!["token"]!)"
                    
                    RequestAPI.shared.setupPostMethod(deviceID: SystemVerification.shared.deviceId, tokenId: SystemVerification.shared.tokenId)
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
        
    }
    @IBAction func signInPage(_ sender: UIButton) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
        transitionFromRight()
        let signInVC: SignInViewController = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.present(signInVC,animated: true)
    }
    
    @objc func back() {
        transitionFromLeft()
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(view,animated: false)
    }
    
    
}




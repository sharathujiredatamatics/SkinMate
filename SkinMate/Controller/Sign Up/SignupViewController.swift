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
    
    
    
    var iconClick = false
    //let imageIcon = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesign()
        lblPhoneError.isHidden = true
        lblEmailError.isHidden = true
        lblPassError.isHidden = true
        lblConfirmError.isHidden = true
        // btnProceed.isEnabled = true
        
        btnProceed.addTarget(self, action: #selector(Proceed), for: .touchUpInside)
        
        
    }
    
    
    
    //MARK:- Hiding navigationbar from first view controller.
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    /*per.viewWillDisappear(animated)
     navigationController?.setNavigationBarHidden(false, animated: animated)
     }*/
    
    //MARK:- Popping view controller
    @IBAction func Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*   @IBAction func Proceed(_ sender: UIButton) {
     /*  if txtPhone.text == nil && txtEmail.text == nil && txtPassword.text == nil && txtConfirm.text == nil{
     /*sender.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
     let sec: OtpEnterViewController = self.storyboard?.instantiateViewController(withIdentifier: "Enter") as! OtpEnterViewController
     self.navigationController?.pushViewController(sec, animated: true)*/
     sender.isEnabled =  false
     
     }*/
     
     
     }
     func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
     PresentationController(presentedViewController: presented, presenting: presenting)
     }*/
    
    
    //MARK:- Securing text entry on eye button click for entering Password.
    func setIcon1(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 0, y: 0, width: 20, height: 20))
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
        } else {
            txtPassword.isSecureTextEntry = true
        }
        
        iconClick = !iconClick
    }
    
    //MARK:- Securing text entry on eye button click for confirming Password.
    
    
    func setIcon2(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 0, y: 0, width: 20, height: 20))
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
        } else {
            txtConfirm.isSecureTextEntry = true
        }
        
        iconClick = !iconClick
    }
    
    
    //MARK:- Customizing text fields.
    
    func applyDesign() {
        
        setIcon1(UIImage(named: "Group 3")!)
        setIcon2(UIImage(named: "Group 3")!)
        txtConfirm.textColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 1)
        txtPassword.textColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 1)
        
        txtPassword.tintColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        txtConfirm.tintColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        txtPhone.tintColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        txtEmail.tintColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 0.6)
        
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 5
        backButton.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        
    }
    
    @objc func Proceed() {
        
        guard  let inputPhone = txtPhone.text else { return }
        if Validation.shared.isValidPhoneNumber(UserPhone: inputPhone) {
            txtPhone.text = inputPhone
            lblPhoneError.isHidden = true
            
        } else {
            lblPhoneError.isHidden = false
            
            
        }
        guard let inputEmail = txtEmail.text else { return }
        if Validation.shared.isValidEmailAddress(emailAddressString: inputEmail){
            txtEmail.text = inputEmail
            lblEmailError.isHidden = true
            
        } else {
            lblEmailError.isHidden = false
            
            
        }
        guard let inputPass = txtPassword.text else { return }
        if Validation.shared.isValidPass(UserPass: inputPass) {
            txtPassword.text = inputPass
            lblPassError.isHidden = true
            
        } else {
            lblPassError.isHidden = false
            
            
        }
        guard let inputConfirm = txtConfirm.text else { return }
        if  Validation.shared.isValidPass(UserPass: inputConfirm) == Validation.shared.isValidPass(UserPass: txtPassword.text!) {
            txtConfirm.text = inputConfirm
            
            
            
            
            
        } else {
            lblConfirmError.isHidden = false
            
            
        }
        if Validation.shared.isValidEmailAddress(emailAddressString: txtEmail.text!) && Validation.shared.isValidPass(UserPass: txtPassword.text!) && Validation.shared.isValidPhoneNumber(UserPhone: txtPhone.text!) && Validation.shared.isValidPass(UserPass: txtConfirm.text!) {
            btnProceed.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
            
            let pass: String = txtPassword.text!
            print(pass)
            print(txtPhone.text!)
            print(txtEmail.text!)
            print(txtConfirm.text!)
            
            setupPostMethod(PhoneNo: txtPhone.text!, Email: txtEmail.text!, Password: txtConfirm.text!)
            
            
            
            let sec: OtpEnterViewController = self.storyboard?.instantiateViewController(withIdentifier: "Enter") as! OtpEnterViewController
            sec.text = txtPhone.text!
            self.navigationController?.pushViewController(sec, animated: true)
            
        }
    }
    
    
    func setupPostMethod(PhoneNo: String,Email: String,Password: String){
        /* guard let uid = self.txtUID.text else { return }
         guard let title = self.txtTitle.text else { return }
         guard let body = self.txtBody.text else { return }*/
        // https://jsonplaceholder.typicode.com/posts/
        if let url = URL(string: "https://skinmate.herokuapp.com/accounts"){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            //   request.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
            let parameters: [String : Any] = [
                "email": Email,
                "password": Password,
                "phone": PhoneNo
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
                    /* guard (200 ... 299) ~= response.statusCode else {
                     print("Status code :- \(response.statusCode)")
                     print(response)
                     
                     return
                     }*/
                    if response.statusCode == 409 {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Error", message: "user already exist", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action: UIAlertAction!) in
                                print("Okay")
                                self.navigationController?.popToRootViewController(animated: true)
                            }))
                            self.present(alert,animated: true,completion: nil)
                        }
                        
                    }
                    else if response.statusCode == 406 {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Error", message: "Validation error", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action: UIAlertAction!) in
                                print("Okay")
                                self.navigationController?.popViewController(animated: true)
                            }))
                            self.present(alert,animated: true,completion: nil)
                            
                        }
                        
                    }
                    else if response.statusCode == 500 {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Error", message: "Could not register", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action: UIAlertAction!) in
                                print("Okay")
                                self.navigationController?.popViewController(animated: true)
                            }))
                            self.present(alert,animated: true,completion: nil)
                        }
                        
                    }
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    print(json!)
                    
                    print(" device Id: \(json!["_id"]!)")
                    print(" token ID: \(json!["token"]!)")
                    Varification.shared.deviceID = "\(json!["_id"]!)"
                    Varification.shared.tokenId = "\(json!["token"]!)"
                    // print(id)
                    // print(token)
                    let savePassword: Bool = KeychainWrapper.standard.set(Password, forKey: Email)
                    let saveDeviceId: Bool = KeychainWrapper.standard.set(Varification.shared.deviceID, forKey: "deviceId\(Email)")
                    let saveTokenId: Bool = KeychainWrapper.standard.set(Varification.shared.tokenId, forKey: "tokenId\(Email)")
                    
                    print("Succesfull\(savePassword)")
                    print("Succesfull\(saveDeviceId)")
                    print("Succesfull\(saveTokenId)")
                    
                    
                    
                    RequestAPI.shared.setupPostMethod(deviceID: Varification.shared.deviceID, tokenId: Varification.shared.tokenId)
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
        
    }
    
    
}




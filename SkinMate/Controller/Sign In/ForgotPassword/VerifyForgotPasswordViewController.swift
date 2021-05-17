//
//  VerifyForgotPasswordViewController.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class VerifyForgotPasswordViewController: UIViewController {
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var lblOtp: UILabel!
    @IBOutlet weak var imgGroup: UIImageView!
    @IBOutlet weak var lblEnterOtp: UILabel!
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var Confirm: UIButton!
    var seconds = 120
    var otpTimer = Timer()
    var isRunning = false
    var number = String()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        txtOTP.defaultTextAttributes.updateValue(5.0, forKey: NSAttributedString.Key.kern)
        runTimer()
        applyDesign()
        
        lblEnterOtp.text = "Please Enter OTP sent to\n\(number)"
        print(lblEnterOtp.text!)
        lblEnterOtp.font = lblEnterOtp.font.withSize(15.0)
        
        
        
    }
    @IBAction func otpEnterFinish(_ sender: UITextField) {
        if txtOTP.text?.count == 6{
            Confirm.isEnabled = true
            Confirm.alpha = 1
        }
        else{
            Confirm.isEnabled = false
            Confirm.alpha = 0.5
        }
    }
    func applyDesign() {
        ContainerView.layer.cornerRadius = 30
        ContainerView.layer.masksToBounds = true
        ContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    func runTimer() {
        otpTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    
    @objc  func updateTimer() {
        
        seconds -= 1
        lblTimer.text = timeString(time: TimeInterval(seconds))
        if seconds == 0{
            otpTimer.invalidate()
            seconds = 120
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02im %02is", minutes,seconds)
    }
    
    @IBAction func Resend(_ sender: UIButton) {
        runTimer()
        VerifyForgotPasswordRequest.shared.changePasswordRequest()
        
        
    }
    
    @IBAction func Confirm(_ sender: UIButton) {
        sender.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        
        VerifyOTP()
        
    }
    
    func  VerifyOTP() {
        
        let otp:Int = Int(txtOTP.text!)!
        print(otp)
        if let url = URL(string: SignInAPI.shared.forgotPasswordHandle){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            //request.setValue(SystemVerification.shared.userAgent, forHTTPHeaderField: "user-agent")
            
            let parameters: [String : Any] = [
                "code": otp,
                "requestId": SignInAPICall.shared.requestId,
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
                    
                    if response.statusCode == 200 {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            let storyBoard:UIStoryboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
                            
                            let newPasswordViewController = storyBoard.instantiateViewController(withIdentifier: "NewPasswordViewController") as! NewPasswordViewController
                            
                            self.present(newPasswordViewController, animated: true)
                        }
                    } else {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            let storyBoard:UIStoryboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
                            
                            let errorVerifyForgotPasswordViewController = storyBoard.instantiateViewController(withIdentifier: "ErrorVerifyForgotPasswordViewController") as! ErrorVerifyForgotPasswordViewController
                            self.present(errorVerifyForgotPasswordViewController, animated: true)
                        }
                    }
                }
                
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    print(json!)
                    
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                    
                }
                }.resume()
            
        }
    }
    
}



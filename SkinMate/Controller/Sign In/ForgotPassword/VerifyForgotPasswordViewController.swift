//
//  VerifyForgotPasswordViewController.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Verify Forgot password class to check request id and otp.
class VerifyForgotPasswordViewController: UIViewController {
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var lblOtp: UILabel!
    @IBOutlet weak var imgGroup: UIImageView!
    @IBOutlet weak var lblEnterOtp: UILabel!
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var Confirm: UIButton!
    @IBOutlet weak var dissmissView: UIView!
    var seconds = 120
    var otpTimer = Timer()
    var isRunning = false
    var number = String()
    var activeTextField : UITextField? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        txtOTP.defaultTextAttributes.updateValue(5.0, forKey: NSAttributedString.Key.kern)
        runTimer()
        applyDesign()
        
        lblEnterOtp.text = "Please Enter OTP sent to \(number)"
        print(lblEnterOtp.text!)
        lblEnterOtp.font = lblEnterOtp.font.withSize(15.0)
        let dissmissViewGesture = UITapGestureRecognizer(target: self, action:  #selector(dissmissViewAction(sender:)))
        dissmissView.isUserInteractionEnabled = true
        dissmissView.addGestureRecognizer(dissmissViewGesture)
        
    }
    // Disssmiss the otp enter view.
    @objc func dissmissViewAction(sender : UITapGestureRecognizer) {
        transitionFromLeft()
        let forgotPasswordViewController = UIStoryboard.init(name: "ForgotPassword", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        present(forgotPasswordViewController!, animated: false)
        
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
        runTimer()
        
        
    }
    
    @IBAction func Confirm(_ sender: UIButton) {
        sender.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        
        VerifyOTP()
        
    }
    // API Call function to verify requested id and otp.
    func  VerifyOTP() {
        let otp:Int = Int(txtOTP.text!)!
        print(otp)
        if let url = URL(string: SignInAPI.shared.forgotPasswordHandle){
            var parameters: [String : Any] = [:]
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            parameters = ["code" : otp, "requestId" : SystemVerification.shared.requestId]
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = parameters.percentEscaped().data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    print(response.statusCode)
                    if response.statusCode == 200 {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            let successForgotPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "SuccessForgotPasswordViewController") as! SuccessForgotPasswordViewController
                            successForgotPasswordViewController.viewId = "setpassword"
                            successForgotPasswordViewController.lblMessage.text = "Otp Verified Successfully"
                            self.present(successForgotPasswordViewController, animated: true)
                        }
                    } else {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            let errorVerifyForgotPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ErrorVerifyForgotPasswordViewController") as! ErrorVerifyForgotPasswordViewController
                            self.present(errorVerifyForgotPasswordViewController, animated: true)
                        }
                    }
                }
                
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    SystemVerification.shared.deviceId = "\(json!["_id"]!)"
                    SystemVerification.shared.tokenId = "\(json!["token"]!)"
                    SystemVerification.shared.userAgent = "\(json!["userAgent"]!)"
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                    
                }
                }.resume()
            
        }
    }
    
}




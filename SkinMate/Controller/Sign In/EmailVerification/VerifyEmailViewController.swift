//
//  VerifyEmailViewController.swift
//  SkinMate
//
//  Created by Datamatics on 06/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class VerifyEmailViewController: UIViewController {
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
    var activeTextField : UITextField? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        txtOTP.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(VerifyEmailViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
        NotificationCenter.default.addObserver(self, selector: #selector(VerifyEmailViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
        txtOTP.defaultTextAttributes.updateValue(5.0, forKey: NSAttributedString.Key.kern)
        runTimer()
        applyDesign()
        
        lblEnterOtp.text = "Please Enter OTP sent to \(number)"
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
        
        VerifyEmailRequest.shared.verifyEmail(tokenId: SystemVerification.shared.tokenId, deviceId: SystemVerification.shared.deviceId)
        runTimer()
        
        
    }
    
    @IBAction func Confirm(_ sender: UIButton) {
        sender.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        
        VerifyOTP()
        
    }
        
    func  VerifyOTP() {
        var parameters = String()
        let otp:Int = Int(txtOTP.text!)!
        print(otp)
        if let url = URL(string: SignInAPI.shared.verifyEmail){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue(SystemVerification.shared.deviceId, forHTTPHeaderField: "device-id")
            request.setValue(SystemVerification.shared.tokenId, forHTTPHeaderField: "access-token")
            
            parameters = "code=\(otp)&requestId=\(SystemVerification.shared.requestId)"
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
                    print(response.statusCode)
                    if response.statusCode == 200 {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            let successEmailVerificationViewController = self.storyboard?.instantiateViewController(withIdentifier: "SuccessEmailVerificationViewController") as! SuccessEmailVerificationViewController
                            self.present(successEmailVerificationViewController, animated: true)
                        }
                    } else {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            let errorEmailVerificationViewController = self.storyboard?.instantiateViewController(withIdentifier: "ErrorEmailVerificationViewController") as! ErrorEmailVerificationViewController
                            self.present(errorEmailVerificationViewController, animated: true)
                        }
                    }
                }
                
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? String
                    
                    
                    print(json!)
                    
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                    
                }
                }.resume()
            
        }
    }
    
}


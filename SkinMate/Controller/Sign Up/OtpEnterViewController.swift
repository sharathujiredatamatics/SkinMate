//
//  OtpEnterViewController.swift
//  DermitologyApplication
//
//  Created by techjini on 30/04/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit

class OtpEnterViewController: UIViewController {
    
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
    
    var text = String()
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    /*  override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(animated)
     navigationController?.setNavigationBarHidden(false, animated: animated)
     }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        txtOTP.defaultTextAttributes.updateValue(5.0, forKey: NSAttributedString.Key.kern)
        runTimer()
        applyDesign()
        
        lblEnterOtp.text = "Please Enter OTP sent to \(text)"
        print(lblEnterOtp.text!)
        lblEnterOtp.font = lblEnterOtp.font.withSize(15.0)
        
        
        
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
        RequestAPI.shared.setupPostMethod(deviceID: Varification.shared.deviceID, tokenId: Varification.shared.tokenId)
        runTimer()
        
        
    }
    
    @IBAction func Confirm(_ sender: UIButton) {
        sender.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        let sec: OtpSuccessViewController = self.storyboard?.instantiateViewController(withIdentifier: "OTP") as! OtpSuccessViewController
        self.navigationController?.pushViewController(sec, animated: true)
        VerifyOTP()
        
    }
    
    func  VerifyOTP() {
        
        let otp:Int = Int(txtOTP.text!)!
        print(otp)
        if let url = URL(string: "https://skinmate.herokuapp.com/accounts/verify/phone"){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            request.setValue(Varification.shared.deviceID, forHTTPHeaderField: "device-id")
            
            request.setValue(Varification.shared.tokenId, forHTTPHeaderField: "access-token")
            //   request.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
            let parameters: [String : Any] = [
                "code": otp,
                "requestId": Varification.shared.Id,
                
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
                            let sec: OtpSuccessViewController = self.storyboard?.instantiateViewController(withIdentifier: "OTP") as! OtpSuccessViewController
                            self.navigationController?.pushViewController(sec, animated: true)
                        }
                    } else {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            let sec: OTPErrorViewController = self.storyboard?.instantiateViewController(withIdentifier: "Error") as! OTPErrorViewController
                            self.navigationController?.pushViewController(sec, animated: true)
                        }
                    }
                }
                
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? String
                    
                    
                    print(json!)
                    
                    // print(" device Id: \(json!["_id"]!)")
                    //    print(" token ID: \(json!["token"]!)")
                    
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                    
                }
                }.resume()
            
        }
    }
    
}







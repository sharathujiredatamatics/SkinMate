//
//  OtpEnterViewController.swift
//  DermitologyApplication
//
//  Created by techjini on 30/04/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit

protocol navigation {
    func pushToSuccessController()
    func pushToInvalidController()
    func dismiss()
}
class OtpEnterViewController: UIViewController, UITextFieldDelegate,navigation {
    
    
    
    
    @IBOutlet weak var ContainerView: UIView!
    
    @IBOutlet weak var lblOtp: UILabel!
    
    @IBOutlet weak var imgGroup: UIImageView!
    
    
    @IBOutlet weak var lblEnterOtp: UILabel!
    
    @IBOutlet weak var txtOTP: UITextField!
    
    @IBOutlet weak var lblTimer: UILabel!
    
    @IBOutlet weak var btnConfirm: UIButton!
    
    
    var seconds = 120
    var otpTimer = Timer()
    var isRunning = false
    
    var text = String()
    
    
    var delegate1: navigation!
    var delegate: navigate!
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtOTP.delegate = self
        // Do any additional setup after loading the view.
        txtOTP.defaultTextAttributes.updateValue(5.0, forKey: NSAttributedString.Key.kern)
        runTimer()
        applyDesign()
        
        lblEnterOtp.text = "Please Enter OTP sent to \(text)"
        print(lblEnterOtp.text!)
        lblEnterOtp.font = lblEnterOtp.font.withSize(15.0)
        txtOTP.delegate = self
        btnConfirm.isEnabled = false
        
        
        
        btnConfirm.addTarget(self, action: #selector(Confirm), for: .touchUpInside)
        
    }
    
    // Delegation methods for presenting view controllers.
    
    func pushToSuccessController() {
        
        let OtpSuccessViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OtpSuccessViewController") as? OtpSuccessViewController
        let navController = UINavigationController(rootViewController: OtpSuccessViewController!)
        OtpSuccessViewController!.modalPresentationStyle = .overCurrentContext
        OtpSuccessViewController!.modalTransitionStyle = .crossDissolve
        self.present(navController,animated: true , completion: nil)
    }
    
    func pushToInvalidController() {
        
        let OTPErrorViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OTPErrorViewController") as? OTPErrorViewController
        OTPErrorViewController!.modalPresentationStyle = .overCurrentContext
        OTPErrorViewController!.modalTransitionStyle = .crossDissolve
        let navController = UINavigationController(rootViewController: OTPErrorViewController! )
        self.present(navController,animated: true , completion: nil)
        
        
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Designing views.
    func applyDesign() {
        ContainerView.layer.cornerRadius = 30
        ContainerView.layer.masksToBounds = true
        ContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        txtOTP.layer.borderWidth = 0.5
        txtOTP.layer.masksToBounds = true
        txtOTP.layer.borderColor =  #colorLiteral(red: 0.8, green: 0.8156862745, blue: 0.8352941176, alpha: 1)
    }
    
    // Timer functions.
    
    func runTimer() {
        otpTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    
    
    @IBAction func txtOtpChanged(_ sender: UITextField) {
        validOtp()
    }
    
    
    
    // Updating timer.
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
    
    
    // Button for resending Otp
    
    
    @IBAction func Resend(_ sender: UIButton) {
        RequestAPI.shared.setupPostMethod(deviceID: SystemVerification.shared.deviceId, tokenId: SystemVerification.shared.tokenId)
        runTimer()
        
        
    }
    
    // Textfield validation.
    
    func validOtp(){
        if txtOTP.text?.count == 6 {
            print(txtOTP.text?.count as Any)
            btnConfirm.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
            btnConfirm.isEnabled = true
        } else if txtOTP.text?.count != 6{
            btnConfirm.isEnabled = false
        }
    }
    
    
    // APICall for varifieing OTP.
    
    @objc func Confirm() {
        
        VerifyAPI.shared.delegate1 = self
        VerifyAPI.shared.setupPostMethod(Code: Int(txtOTP.text!)!, Id: SystemVerification.shared.requestId, deviceID: SystemVerification.shared.deviceId, tokenId: SystemVerification.shared.tokenId)
    }
    
}


//
//  ErrorVerifyForgotPasswordViewController.swift
//  SkinMate
//
//  Created by Datamatics on 10/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Error OTP message viewcontroller.
class ErrorVerifyForgotPasswordViewController: UIViewController {
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblOtp: UILabel!
    @IBOutlet weak var lblInvalid: UILabel!
    @IBOutlet weak var btnRetry: UIButton!
    var userData = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        applyDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    func applyDesign() {
        ContainerView.layer.cornerRadius = 30
        ContainerView.layer.masksToBounds = true
        ContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
    }
    // Button function to retry verify forgot password.
    @IBAction func btnRetry(_ sender: UIButton) {
        if VerifyForgotPasswordRequest.shared.emailId == ""{
            userData = VerifyForgotPasswordRequest.shared.phoneNumber
        }
        else{
            userData = VerifyForgotPasswordRequest.shared.emailId
        }
        VerifyForgotPasswordRequest.shared.changePasswordRequest()
        let verifyForgotPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "VerifyForgotPasswordViewController") as! VerifyForgotPasswordViewController
        verifyForgotPasswordViewController.number = userData
        self.present(verifyForgotPasswordViewController, animated: true)
    }
}

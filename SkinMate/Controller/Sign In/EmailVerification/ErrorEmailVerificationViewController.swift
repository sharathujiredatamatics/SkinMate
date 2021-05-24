//
//  ErrorEmailVerificationViewController.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Class showing error message that OTP authentication failed retry.
class ErrorEmailVerificationViewController: UIViewController {
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblOtp: UILabel!
    @IBOutlet weak var lblInvalid: UILabel!
    @IBOutlet weak var btnRetry: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        applyDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    /* override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(animated)
     navigationController?.setNavigationBarHidden(false, animated: animated)
     }*/
    func applyDesign() {
        ContainerView.layer.cornerRadius = 30
        ContainerView.layer.masksToBounds = true
        ContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
    }
    // Button function to retry OTP.
    @IBAction func btnRetry(_ sender: UIButton) {
        VerifyEmailRequest.shared.verifyEmail(tokenId: SystemVerification.shared.tokenId, deviceId: SystemVerification.shared.deviceId)
        let verifyEmailViewController = self.storyboard?.instantiateViewController(withIdentifier: "VerifyEmailViewController") as! VerifyEmailViewController
        self.present(verifyEmailViewController, animated: true)
    }
}

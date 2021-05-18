//
//  OTPErrorViewController.swift
//  DermitologyApplication
//
//  Created by techjini on 01/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit

class OTPErrorViewController: UIViewController {
    
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
    
    @IBAction func btnRetry(_ sender: UIButton) {
        RequestAPI.shared.setupPostMethod(deviceID: SystemVerification.shared.deviceId, tokenId: SystemVerification.shared.tokenId)
        let otpEnterViewController = self.storyboard?.instantiateViewController(withIdentifier: "OtpEnterViewController") as! OtpEnterViewController
        self.present(otpEnterViewController, animated: true)
    }
}

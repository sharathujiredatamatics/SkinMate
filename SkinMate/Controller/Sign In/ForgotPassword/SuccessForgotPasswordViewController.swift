//
//  SuccessForgotPasswordViewController.swift
//  SkinMate
//
//  Created by Datamatics on 20/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// OTP verified successfully viewcontroller showing password verified successfully.
class SuccessForgotPasswordViewController: UIViewController {
    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var imgSuccess: UIImageView!
    @IBOutlet weak var lblVerified: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnOkay: UIButton!
    var viewId = String()
    override func viewDidLoad() {
        super.viewDidLoad()
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
    //MARK:- Corner Radius for Containerview.
    func applyDesign() {
        ContainerView.layer.cornerRadius = 30
        ContainerView.layer.masksToBounds = true
        ContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
    }
    // Button function to go to new password entry page.
    @IBAction func SetUp(_ sender: UIButton) {
        if viewId == "setpassword"{
            let storyBoard: UIStoryboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
            let newPasswordViewController = storyBoard.instantiateViewController(withIdentifier: "NewPasswordViewController") as! NewPasswordViewController
            self.present(newPasswordViewController, animated: true)
        }
        else if viewId == "successpassword"{
            
        }
    }
}

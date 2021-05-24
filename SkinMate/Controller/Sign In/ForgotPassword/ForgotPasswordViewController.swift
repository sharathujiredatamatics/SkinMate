//
//  ForgotPasswordViewController.swift
//  SkinMate
//
//  Created by Datamatics on 05/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Forgot Password Class to manage all forgot password actions.
class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var backToSignIn: UIButton!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var errorPhoneNumber: UILabel!
    @IBOutlet weak var continueForgotPasswordButton: UIButton!
    var passwordSate = true
    var validUserId = false
    var userIdPhone = String()
    var userIdEmail = String()
    var userInfo = String()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // TextFiled functions to check user deatils
    @IBAction func phoneNumberEditChange(_ sender: UITextField) {
        checkUserId()
    }
    @IBAction func phoneNumberEditChangeEnd(_ sender: UITextField) {
        checkUserIdEnd()
    }
    // Button function to go enter otp page.
    @IBAction func continueForgotPassword(_ sender: UIButton) {
        checkPhoneOrEmail()
        changePasswordRequest(userIdEmail : userIdEmail ,userIdPhone : userIdPhone)
    }
    // Button function to go back to last view.
    @IBAction func backButton(_ sender: UIButton) {
        transitionFromLeft()
        let signInViewController = UIStoryboard.init(name: "SignIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController
        present(signInViewController!, animated: false)
    }
    
}

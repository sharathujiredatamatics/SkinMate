//
//  NewPasswordViewController.swift
//  SkinMate
//
//  Created by Datamatics on 05/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class NewPasswordViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorPassword: UILabel!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var errorConfirmPassword: UILabel!
    @IBOutlet weak var changePasswordButton: UIButton!
    var validPassword = false
    var passwordSate = true
    var validConfimPassword = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func passwordDidTypeFinish(_ sender: UITextField) {
        checkPassword()
    }
    
    @IBAction func confirmPaswwordDidTypeFinish(_ sender: UITextField) {
        checkConfirmPassword()
    }
    @IBAction func changePassword(_ sender: UIButton) {
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        let forgotPasswordViewController = UIStoryboard.init(name: "SignIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        self.present(forgotPasswordViewController!, animated: true, completion: nil)
        
    }
}

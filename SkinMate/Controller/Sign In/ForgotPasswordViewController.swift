//
//  ForgotPasswordViewController.swift
//  SkinMate
//
//  Created by Datamatics on 05/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var errorPhoneNumber: UILabel!
    @IBOutlet weak var continueForgotPasswordButton: UIButton!
    var passwordSate = true
    var validUserId = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func phoneNumberEditChange(_ sender: UITextField) {
        //checkUserId()
    }
    @IBAction func continueForgotPassword(_ sender: UIButton) {
    }
    @IBAction func backButton(_ sender: UIButton) {
        let signInViewController = UIStoryboard.init(name: "SignIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController
        self.present(signInViewController!, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//
//  SuccessEmailVerificationViewController.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class SuccessEmailVerificationViewController: UIViewController {
    
    @IBOutlet weak var ContainerView: UIView!
    
    @IBOutlet weak var imgSuccess: UIImageView!
    
    @IBOutlet weak var lblVerified: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var btnOkay: UIButton!
    
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
    @IBAction func SetUp(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
        let signInViewController = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.present(signInViewController, animated: true)
        
    }
}


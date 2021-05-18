//
//  ViewController.swift
//  DermitologyApplication
//
//  Created by techjini on 20/04/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var ContainerView: UIView!
    
    
    @IBOutlet weak var LogoStack: UIStackView!
    
    @IBOutlet weak var lblWelcome: UILabel!
    
    @IBOutlet weak var imgBitmap: UIImageView!
    
    @IBOutlet weak var logoStack1: UIStackView!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var RegistrationView: UIView!
    
    @IBOutlet weak var RegisterStack: UIStackView!
    
    @IBOutlet weak var SignUp: UIButton!
    
    @IBOutlet weak var SignIn: UIButton!
    
    @IBOutlet weak var lblPrivacy: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesign()
        
    }
    
    
    //MARK:- Hiding navigationbar from first view controller.
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    /*  override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(animated)
     navigationController?.setNavigationBarHidden(false, animated: animated)
     }*/
    
    
    
    //MARK:- Navigation to the SignUp page.
    
    @IBAction func Signup(_ sender: UIButton) {
        
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let signupVC: SignupViewController = storyBoard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        
        self.present(signupVC, animated: true)
        
        
    }
    @IBAction func signIn(_ sender: UIButton) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
        
        let signInVC: SignInViewController = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.present(signInVC, animated: true, completion: nil)
        
    }
    //MARK:- function for animating views.
    func applyDesign() {
        // Making top to corners of RegistrationView round.
        let blur: CGFloat = 26
        
        RegistrationView.layer.cornerRadius = 30
        RegistrationView.layer.masksToBounds = true
        RegistrationView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        //Specifying shadow to the RegistrationView.
        RegistrationView.layer.shadowColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        RegistrationView.layer.shadowOpacity = 0.3
        RegistrationView.layer.shadowOffset = CGSize(width: 0, height: 5)
        RegistrationView.layer.shadowRadius = blur
        RegistrationView.layer.shadowPath = UIBezierPath(rect: RegistrationView.bounds).cgPath
        RegistrationView.layer.shouldRasterize = true
        RegistrationView.layer.rasterizationScale = UIScreen.main.scale
        
        //  Specifieng border color and width to the siugn up button.
        SignUp.layer.borderWidth = 2
        SignUp.layer.borderColor = #colorLiteral(red: 0.7294117647, green: 0.8039215686, blue: 0.8392156863, alpha: 1)
        
    }
    
    
}


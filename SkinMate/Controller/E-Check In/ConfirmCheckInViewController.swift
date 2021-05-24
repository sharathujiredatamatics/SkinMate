//
//  ConfirmCheckInViewController.swift
//  SkinMate
//
//  Created by techjini on 18/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class ConfirmCheckInViewController: UIViewController {
    
    
    @IBOutlet weak var navigationView: UIView!
    
    @IBOutlet weak var bnackButton: UIButton!
    
    
    @IBOutlet weak var lblCheckIn: UILabel!
    
    @IBOutlet weak var checkInScroll: UIScrollView!
    
    @IBOutlet weak var checkInScrollView: UIView!
    
    
    @IBOutlet weak var imgSympton: UIImageView!
    
    
    @IBOutlet weak var coughView: UIView!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    
    @IBOutlet weak var stackFirst: UIStackView!
    
    @IBOutlet weak var parentView: UIView!
    
    @IBOutlet weak var imgCough: UIImageView!
    
    @IBOutlet weak var lblCough: UILabel!
    
    @IBOutlet weak var coughSelect: UIImageView!
    
    @IBOutlet weak var feverView: UIView!
    
    @IBOutlet weak var imgFever: UIImageView!
    
    @IBOutlet weak var lblFever: UILabel!
    
    @IBOutlet weak var lfeverSelected: UIImageView!
    
    @IBOutlet weak var secondStack: UIStackView!
    
    
    
    @IBOutlet weak var coldView: UIView!
    
    @IBOutlet weak var imgCold: UIImageView!
    
    @IBOutlet weak var lblCold: UILabel!
    
    @IBOutlet weak var coldSelected: UIImageView!
    
    
    @IBOutlet weak var noneView: UIView!
    
    @IBOutlet weak var imgNone: UIImageView!
    
    @IBOutlet weak var lblNone: UILabel!
    
    @IBOutlet weak var noneSelected: UIImageView!
    
    @IBOutlet weak var buttonConfirm: UIButton!
    
    @IBOutlet weak var finalView: UIView!
    
    @IBOutlet weak var imgInfo: UIImageView!
    
    @IBOutlet weak var lblFinalMessage: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        coughSelect.isHidden = true
        coldSelected.isHidden = true
        lfeverSelected.isHidden = true
        noneSelected.isHidden = true
        applyDesign()
        gestureHandler()
        buttonConfirm.addTarget(self, action: #selector(confoirm), for: .touchUpInside)
        bnackButton.addTarget(self, action: #selector(loadCheckIntPage), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    // Hide navigation bar.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // Apply design function.
    
    func applyDesign(){
        finalView.layer.masksToBounds = true
        finalView.layer.cornerRadius = 38
        finalView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        finalView.layer.borderWidth = 2
        finalView.layer.borderColor = #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9137254902, alpha: 1)
        
        
        
        
        coughView.layer.cornerRadius = 20
        coughView.layer.masksToBounds = true
        coughView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        
        coughView.layer.borderWidth = 2
        coughView.layer.borderColor =  #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        
        
        feverView.layer.cornerRadius = 20
        feverView.layer.masksToBounds = true
        feverView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
        feverView.layer.borderWidth = 2
        feverView.layer.borderColor =  #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        
        
        coldView.layer.cornerRadius = 20
        coldView.layer.masksToBounds = true
        coldView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
        coldView.layer.borderWidth = 2
        coldView.layer.borderColor =  #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        
        noneView.layer.cornerRadius = 20
        noneView.layer.masksToBounds = true
        noneView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        
        noneView.layer.borderWidth = 2
        noneView.layer.borderColor =  #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        
    }
    // Gesture handler functions.
    
    func gestureHandler(){
        let cough = UITapGestureRecognizer(target: self, action:  #selector(coughAdict(sender:)))
        coughView.isUserInteractionEnabled = true
        coughView.addGestureRecognizer(cough)
        
        let fever = UITapGestureRecognizer(target: self, action:  #selector(feverAdict(sender:)))
        feverView.isUserInteractionEnabled = true
        feverView.addGestureRecognizer(fever)
        
        let cold = UITapGestureRecognizer(target: self, action:  #selector( coldAdict(sender:)))
        coldView.isUserInteractionEnabled = true
        coldView.addGestureRecognizer(cold)
        
        
        let none = UITapGestureRecognizer(target: self, action:  #selector(none(sender:)))
        noneView.isUserInteractionEnabled = true
        noneView.addGestureRecognizer(none)
        
    }
    
    @objc func coughAdict(sender : UITapGestureRecognizer) {
        coughSelect.isHidden = false
        coughView.layer.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7490196078, blue: 0.7215686275, alpha: 1)
        
    }
    @objc func coldAdict(sender : UITapGestureRecognizer) {
        coldSelected.isHidden = false
        coldView.layer.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7490196078, blue: 0.7215686275, alpha: 1)
        
    }
    @objc func feverAdict(sender : UITapGestureRecognizer) {
        lfeverSelected.isHidden = false
        feverView.layer.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7490196078, blue: 0.7215686275, alpha: 1)
        
    }
    @objc func none(sender : UITapGestureRecognizer) {
        noneSelected.isHidden = false
        noneView.layer.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7490196078, blue: 0.7215686275, alpha: 1)
        
    }
    @objc func confoirm(){
        transitionFromRight()
        let CompleteCheckViewController = UIStoryboard.init(name: "CheckIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompleteCheckViewController") as? CompleteCheckViewController
        self.present(CompleteCheckViewController!,animated: true)
    }
    
    @objc func loadCheckIntPage(_sender: UIButton){
        transitionFromLeft()
        let CheckInViewController = UIStoryboard.init(name: "CheckIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "CheckInViewController") as? CheckInViewController
        self.present(CheckInViewController!,animated: true,completion: nil)
    }
    
    
    
}

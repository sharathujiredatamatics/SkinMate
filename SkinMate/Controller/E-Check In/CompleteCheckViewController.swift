//
//  CompleteCheckViewController.swift
//  SkinMate
//
//  Created by techjini on 19/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class CompleteCheckViewController: UIViewController {
    @IBOutlet weak var NavigationView: UIView!
    
    
    @IBOutlet weak var NavigationStack: UIStackView!
    
    
    @IBOutlet weak var backButto: UIButton!
    
    
    @IBOutlet weak var checkInLabel: UILabel!
    
    @IBOutlet weak var checkScroll: UIScrollView!
    
    @IBOutlet weak var checkView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var locationImage: UIImageView!
    
    @IBOutlet weak var titleImage: UILabel!
    
    @IBOutlet weak var messageImage: UILabel!
    
    
    
    @IBOutlet weak var secondView: UIView!
    
    
    
    @IBOutlet weak var infoCheck: UIImageView!
    
    
    @IBOutlet weak var infoMessage: UILabel!
    
    
    @IBOutlet weak var thirdView: UIView!
    
    
    @IBOutlet weak var appointmentSummary: UILabel!
    
    
    @IBOutlet weak var lblDoctor: UILabel!
    
    
    @IBOutlet weak var lblSelf: UILabel!
    
    
    @IBOutlet weak var bulletOne: UILabel!
    
    
    @IBOutlet weak var bulletTwo: UILabel!
    
    
    @IBOutlet weak var lblTreatment: UILabel!
    
    
    @IBOutlet weak var lblId: UILabel!
    
    
    @IBOutlet weak var lblDate: UILabel!
    
    
    @IBOutlet weak var lblTime: UILabel!
    
    
    
    @IBOutlet weak var lblDoctorInfo: UILabel!
    
    
    @IBOutlet weak var bulletThree: UILabel!
    
    @IBOutlet weak var lblDateTime: UILabel!
    
    @IBOutlet weak var bulletFour: UILabel!
    
    
    @IBOutlet weak var imageDoctor: UIImageView!
    
    
    @IBOutlet weak var finalView: UIView!
    
    @IBOutlet weak var imgSuccess: UIView!
    
    @IBOutlet weak var lblCompleted: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesign()
        backButto.addTarget(self, action: #selector(checkIn), for: .touchUpInside)
        gestureHandler()
        
        // Do any additional setup after loading the view.
    }
    // Hide navigation bar.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    func applyDesign() {
        
        firstView.layer.masksToBounds = true
        firstView.layer.cornerRadius = 25
        firstView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        firstView.layer.borderWidth = 2
        firstView.layer.borderColor = #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9137254902, alpha: 1)
        
        
        secondView.layer.masksToBounds = true
        secondView.layer.cornerRadius = 35
        secondView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        secondView .layer.borderWidth = 2
        secondView.layer.borderColor = #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9137254902, alpha: 1)
        
        lblSelf.layer.borderColor =  #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9137254902, alpha: 1)
        lblSelf.layer.borderWidth = 1
        
        thirdView.layer.masksToBounds = true
        thirdView.layer.cornerRadius = 25
        thirdView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        thirdView.layer.borderWidth = 2
        thirdView.layer.borderColor = #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9137254902, alpha: 1)
        
        finalView.layer.masksToBounds = true
        finalView.layer.cornerRadius = 35
        finalView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMinYCorner]
        finalView.layer.borderWidth = 2
        finalView.layer.borderColor = #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9137254902, alpha: 1)
        
        imgSuccess.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imgSuccess.layer.borderWidth = 1.5
        
        
    }
    
    @objc func checkIn(){
        transitionFromLeft()
        let ConfirmCheckInViewController = UIStoryboard.init(name: "CheckIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "ConfirmCheckInViewController") as? ConfirmCheckInViewController
        self.present(ConfirmCheckInViewController!, animated: true, completion: nil)
    }
    // Gesture handler functions.
    func  gestureHandler(){
        let touch = UITapGestureRecognizer(target: self, action:  #selector(success(sender:)))
        imgSuccess.isUserInteractionEnabled = true
        imgSuccess.addGestureRecognizer(touch)
    }
    
    @objc func success(sender: UITapGestureRecognizer){
        transitionFromLeft()
        let InstructionViewController = UIStoryboard.init(name: "CheckIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "InstructionViewController") as? InstructionViewController
        InstructionViewController!.modalPresentationStyle = .overCurrentContext
        InstructionViewController!.modalTransitionStyle = .crossDissolve
        
        
        self.present(InstructionViewController!,animated: true)
        
    }
    
    
}

//
//  CheckInViewController.swift
//  SkinMate
//
//  Created by techjini on 18/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {
    
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
    
    
    @IBOutlet weak var lblRequest: UILabel!
    
    @IBOutlet weak var checkInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        applyDesign()
        checkInButton.addTarget(self, action: #selector(checkIn), for: .touchUpInside)
        backButto.addTarget(self, action: #selector(back), for: .touchUpInside)
        
    }
    // Hide navigation bar.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    // Applying design to views.
    func applyDesign() {
        
        firstView.layer.masksToBounds = true
        firstView.layer.cornerRadius = 30
        firstView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        firstView.layer.borderWidth = 2
        firstView.layer.borderColor = #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9137254902, alpha: 1)
        
        
        secondView.layer.masksToBounds = true
        secondView.layer.cornerRadius = 40
        secondView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        secondView .layer.borderWidth = 2
        secondView.layer.borderColor = #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9137254902, alpha: 1)
        
        lblSelf.layer.borderColor =  #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9137254902, alpha: 1)
        lblSelf.layer.borderWidth = 1
        
        thirdView.layer.masksToBounds = true
        thirdView.layer.cornerRadius = 30
        thirdView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        thirdView.layer.borderWidth = 2
        thirdView.layer.borderColor = #colorLiteral(red: 0.8980392157, green: 0.9058823529, blue: 0.9137254902, alpha: 1)
        
        
        
    }
    
    // Transition from viewcomtroller
    @objc func checkIn(){
        transitionFromRight()
        let ConfirmCheckInViewController = UIStoryboard.init(name: "CheckIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "ConfirmCheckInViewController") as? ConfirmCheckInViewController
        self.navigationController?.pushViewController(ConfirmCheckInViewController!, animated: true)
    }
    @objc func back(){
        transitionFromLeft()
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "allappointments"
        self.present(mainTabController!, animated: true, completion: nil)
        
    }
    
    
}


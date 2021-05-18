//
//  HomeViewController.swift
//  SkinMate
//
//  Created by Datamatics on 28/04/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblSchedule: UILabel!
    
    @IBOutlet weak var imgTeleVideo: UIImageView!
    
    @IBOutlet weak var firstStack: UIStackView!
    @IBOutlet weak var teleView: UIView!
    
    @IBOutlet weak var lblTeleVideo: UILabel!
    
    @IBOutlet weak var medicalView: UIView!
    
    @IBOutlet weak var imgMedical: UIImageView!
    
    @IBOutlet weak var SecondStack: UIStackView!
    
    @IBOutlet weak var lblMedical: UILabel!
    
    @IBOutlet weak var cosmaticcView: UIView!
    
    @IBOutlet weak var imgCosmatic: UIImageView!
    
    @IBOutlet weak var lblCosmatics: UILabel!
    
    @IBOutlet weak var skinCareView: UIView!
    
    @IBOutlet weak var imgSkin: UIImageView!
    
    @IBOutlet weak var lblSkin: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyDesign()
        gestureHandler()
        
        // Do any additional setup after loading the view.
    }
    
    func applyDesign() {
        
        teleView.layer.cornerRadius = 10
        teleView.layer.masksToBounds = true
        teleView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        
        teleView.layer.borderWidth = 1
        teleView.layer.borderColor =  #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        
        
        medicalView.layer.cornerRadius = 10
        medicalView.layer.masksToBounds = true
        medicalView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
        medicalView.layer.borderWidth = 1
        medicalView.layer.borderColor =  #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        
        
        cosmaticcView.layer.cornerRadius = 10
        cosmaticcView.layer.masksToBounds = true
        cosmaticcView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
        cosmaticcView.layer.borderWidth = 1
        cosmaticcView.layer.borderColor =  #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        
        skinCareView.layer.cornerRadius = 10
        skinCareView.layer.masksToBounds = true
        skinCareView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        
        skinCareView.layer.borderWidth = 1
        skinCareView.layer.borderColor =  #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        
    }
    // GestureHandler function to diss the View.
    func gestureHandler(){
        let teleHealth = UITapGestureRecognizer(target: self, action:  #selector(teleHealthAppointment(sender:)))
        teleView.isUserInteractionEnabled = true
        teleView.addGestureRecognizer(teleHealth)
        
        let medical = UITapGestureRecognizer(target: self, action:  #selector(medicalAppointment(sender:)))
        medicalView.isUserInteractionEnabled = true
        medicalView.addGestureRecognizer(medical)
        
        let cosmatic = UITapGestureRecognizer(target: self, action:  #selector(cosmaticAppointment(sender:)))
        cosmaticcView.isUserInteractionEnabled = true
        cosmaticcView.addGestureRecognizer(cosmatic)
        
        
        let skinCare = UITapGestureRecognizer(target: self, action:  #selector(skinCareAppointment(sender:)))
        skinCareView.isUserInteractionEnabled = true
        skinCareView.addGestureRecognizer(skinCare)
        
    }
    
    @objc func teleHealthAppointment(sender : UITapGestureRecognizer) {
     
    }
    @objc func medicalAppointment(sender : UITapGestureRecognizer) {
        let serviceViewController = UIStoryboard.init(name: "BookingAppointment", bundle: Bundle.main).instantiateViewController(withIdentifier: "appointment1") as? ServiceViewController
        self.present(serviceViewController!, animated: true, completion: nil)
    }
    @objc func cosmaticAppointment(sender : UITapGestureRecognizer) {
   
     }
    @objc func skinCareAppointment(sender : UITapGestureRecognizer) {
       
    }
    
}

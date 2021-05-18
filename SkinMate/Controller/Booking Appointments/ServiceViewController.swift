//
//  ViewController.swift
//  BookAppointments
//
//  Created by techjini on 22/04/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit


class ServiceViewController: UIViewController {
    
    @IBOutlet weak var radiationTherapyView: UIView!
    @IBOutlet weak var medicalExaminationView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
          //view border deisgn
        medicalExaminationView.layer.borderWidth = 1
        medicalExaminationView.layer.masksToBounds = true
        medicalExaminationView.clipsToBounds = true
        medicalExaminationView.layer.cornerRadius = 20
        medicalExaminationView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
        radiationTherapyView.layer.borderWidth = 1
        radiationTherapyView.clipsToBounds = true
        radiationTherapyView.layer.masksToBounds = true
        radiationTherapyView.layer.cornerRadius = 20
        radiationTherapyView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        /*
        //back Button design
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = DesignColor.shared.getUIColor(hex: "#2122C")?.cgColor
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 5
        backButton.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        */
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        medicalExaminationView.addGestureRecognizer(gestureRecognizer)
        medicalExaminationView.isUserInteractionEnabled = true
        
    }
    
    @objc func gestureFired(_ gesture: UITapGestureRecognizer){
        if gesture.view == medicalExaminationView{
        medicalExaminationView.backgroundColor = DesignColor.shared.getUIColor(hex: "#B2BFB8")
        radiationTherapyView.backgroundColor = .white
        ComformAppointmentDetails.shared.service = "Medical"
        // navigation next doctor slection controller
        let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment2") as! SelectDoctorViewController
        self.present(navigate, animated: true, completion: nil)
        }
        else if gesture.view == radiationTherapyView{
           // let navigate = storyboard?.instantiateViewController(withIdentifier: " ") as! SelectDoctorViewController
         //   self.present(navigate, animated: true, completion: nil)
            
        }
    }
    
    //back to home controller
   
    @IBAction func backButton(_ sender: Any) {
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "bookappointment"
        self.present(mainTabController!, animated: true)
    }
    
    
   
}


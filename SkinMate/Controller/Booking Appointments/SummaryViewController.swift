//
//  SummaryViewController.swift
//  BookAppointments
//
//  Created by techjini on 05/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//
import UIKit
protocol FamilyMemberDataPass{
    func familyMemberPassing(name: String)
    func insuranceInformation(Id: String)
}
class SummaryViewController: UIViewController,UITextFieldDelegate,FamilyMemberDataPass {
    
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var serviceView: UIView!
    @IBOutlet weak var seviceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var selectFamilyMember: UILabel!
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var appointmentforView: UIView!
    @IBOutlet weak var insuranceButton1: UIButton!
    
    @IBOutlet weak var insuranceButton2: UIButton!
    @IBOutlet weak var insuranvceButton3: UIButton!
    @IBOutlet weak var insuranceView: UIView!
    
    @IBOutlet weak var commentFieldView: UIView!
    
    @IBOutlet weak var appointmentview: UIView!
    @IBOutlet weak var insurance4: UIButton!
    @IBOutlet weak var insuranceInformation: UITextField!
    @IBOutlet weak var commentField: UITextField!
    
    @IBOutlet weak var commentView: UIView!
    
    @IBOutlet weak var insuranceButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var insuranceLabel1 = String()
    var insuranceLabel2 = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.enable = true
        
        insuranceInformation.delegate = self
        commentField.delegate = self
        
        //view border design
        let thickness: CGFloat = 1.0
        let serviceBorder = CALayer()
        serviceBorder.frame = CGRect(x: 0, y: self.serviceView.frame.height - thickness, width: self.serviceView.frame.size.width, height: thickness)
        serviceBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        serviceView.layer.addSublayer(serviceBorder)
        
        let dateBorder = CALayer()
        dateBorder.frame = CGRect(x: 0, y: self.dateView.frame.height - thickness, width: self.dateView.frame.size.width, height: thickness)
        dateBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        dateView.layer.addSublayer(dateBorder)
        
        let appointmentBorder = CALayer()
        appointmentBorder.frame = CGRect(x: 0, y: self.appointmentview.frame.height - thickness, width: self.appointmentview.frame.size.width, height: thickness)
        appointmentBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        appointmentview.layer.addSublayer(appointmentBorder)
        
        let insuranceBorder = CALayer()
        insuranceBorder.frame = CGRect(x: 0, y: self.insuranceView.frame.height - thickness, width: self.insuranceView.frame.size.width, height: thickness)
        insuranceBorder.backgroundColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        insuranceView.layer.addSublayer(insuranceBorder)
        
        appointmentforView.layer.borderWidth = 1
        appointmentforView.layer.borderColor = DesignColor.shared.getUIColor(hex: "#CCD0D5")?.cgColor
        appointmentforView.layer.masksToBounds = true
        appointmentforView.clipsToBounds = true
        appointmentforView.layer.cornerRadius = 10
        appointmentforView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner]
        
        
        insuranceInformation.layer.borderWidth = 1
        insuranceInformation.layer.borderColor = DesignColor.shared.getUIColor(hex: "#CCD0D5")?.cgColor
        insuranceInformation.layer.masksToBounds = true
        insuranceInformation.layer.cornerRadius = 10
        
        commentFieldView.layer.borderWidth = 1
        commentFieldView.layer.borderColor = DesignColor.shared.getUIColor(hex: "#CCD0D5")?.cgColor
        commentFieldView.layer.masksToBounds = true
        commentFieldView.layer.cornerRadius = 10
        commentField.borderStyle = UITextField.BorderStyle.none
        
        // radio button disable as default state
        insuranvceButton3.isEnabled = false
        insurance4.isEnabled = false
        
        // assign values to label
        seviceLabel.text = ComformAppointmentDetails.shared.service
        dateLabel.text = ComformAppointmentDetails.shared.date + "," + ComformAppointmentDetails.shared.time
        remainingTime.text = ComformAppointmentDetails.shared.remainingTime
        confirmButton.alpha = 0.5
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //appointment default is for
        selectFamilyMember.text = ComformAppointmentDetails.shared.appointmentfor
    }
    //validate Confirm Button
    func validateConfirmButton(){
        if insuranceButton1.isSelected == true{
            
            if insuranvceButton3.isSelected == true{
                confirmButton.alpha = 1
            }
        }
        else if insuranceButton2.isSelected == true {
            if insuranvceButton3.isSelected == true || insurance4.isSelected == true {
                confirmButton.alpha = 1
                
            }
        }
        else {
            confirmButton.alpha = 0.5
            
        }
        
        
    }
    
    // schedule comform button
    @IBAction func conformationButton(_ sender: Any) {
        ComformAppointmentDetails.shared.payingType = insuranceLabel1
        ComformAppointmentDetails.shared.insuranceInfo = insuranceInformation.text!
        if insuranceButton1.isSelected == true && insuranvceButton3.isSelected == true{
            if  (insuranceInformation.text?.isEmpty)! == false{
                PostBookingAppoint.shared.bookingAppointmentPost()
                let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment5") as! ScheduleConfirmViewController
                transitionFromRight()
                // navigationController?.pushViewController(navigate, animated: false)
                self.present(navigate, animated: false, completion: nil)
            }
        }
        else if insuranceButton2.isSelected == true{
            if insuranvceButton3.isSelected == true || insurance4.isSelected == true {
                if  (insuranceInformation.text?.isEmpty)! == false{
                    PostBookingAppoint.shared.bookingAppointmentPost()
                    let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment5") as! ScheduleConfirmViewController
                    transitionFromRight()
                    // navigationController?.pushViewController(navigate, animated: false)
                    self.present(navigate, animated: false, completion: nil)
                }
            }
        }
    }
    //back button
    @IBAction func backButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment3") as! DateTimeViewController
        transitionFromLeft()
        // navigationController?.popToViewController(navigate, animated: false)
        self.present(navigate, animated: false, completion: nil)
        
    }
    //insurance radio button actions
    @IBAction func insuranceButton2(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            validateConfirmButton()
            
        }
        else{
            sender.isSelected = true
            validateConfirmButton()
            insuranceButton1.isSelected = false
            insuranceLabel1 = "Pay with Insurance"
            insuranvceButton3.isEnabled = true
            insurance4.isEnabled = true
        }
        
    }
    @IBAction func insuranceButton1(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            validateConfirmButton()
            
        }
        else{
            sender.isSelected = true
            validateConfirmButton()
            insuranceButton2.isSelected = false
            insuranceLabel1 = "Paying Self"
            insuranvceButton3.isEnabled = true
            insurance4.isEnabled = false
            
        }
    }
    @IBAction func insuranceButton3(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            validateConfirmButton()
            
        }
        else{
            
            sender.isSelected = true
            validateConfirmButton()
            insurance4.isSelected = false
            insuranceLabel2 = "Select from Existing"
            insuranceButton.isHidden = false
            
            
        }
        
    }
    @IBAction func insuranceButton4(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            validateConfirmButton()
            
        }
        else{
            
            sender.isSelected = true
            validateConfirmButton()
            insuranvceButton3.isSelected = false
            insuranceLabel2 = "Add new Insurance details"
            insuranceButton.isHidden = true
            
        }
    }
    
    // fetch the insurance
    @IBAction func insuranceButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "InsuranceDetailsViewController") as! InsuranceDetailsViewController
        navigate.delegate = self
        navigate.modalPresentationStyle = .overCurrentContext
        navigate.modalTransitionStyle = .crossDissolve
        self.present(navigate,animated: true, completion: nil)
        self.validateConfirmButton()
        
    }
    
    
    //fetch the family member
    @IBAction func selectfamilyMemberButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment") as! AppointFamilyMemberViewController
        navigate.delegate = self
        navigate.modalPresentationStyle = .overCurrentContext
        navigate.modalTransitionStyle = .crossDissolve
        self.present(navigate,animated: true, completion: nil)
    }
    func familyMemberPassing(name: String) {
        selectFamilyMember.text = name
    }
    func insuranceInformation(Id: String) {
        insuranceInformation.text = Id
    }
    
}




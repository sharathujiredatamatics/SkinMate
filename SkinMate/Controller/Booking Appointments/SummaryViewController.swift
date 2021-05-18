//
//  SummaryViewController.swift
//  BookAppointments
//
//  Created by techjini on 05/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var serviceView: UIView!
    @IBOutlet weak var seviceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var selectFamilyMember: UILabel!
    
    @IBOutlet weak var insuranceButton1: UIButton!
    @IBOutlet weak var insuranceButton2: UIButton!
    @IBOutlet weak var insuranvceButton3: UIButton!
    @IBOutlet weak var insuranceView: UIView!
    
    @IBOutlet weak var appointmentview: UIView!
    @IBOutlet weak var insurance4: UIButton!
    @IBOutlet weak var insuranceInformation: UITextField!
    @IBOutlet weak var commentField: UITextField!
    
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var insurancePickerView: UIPickerView!
    @IBOutlet weak var insuranceButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var insuranceLabel1 = String()
    var insuranceLabel2 = String()
    var insuranceArray: [String] = ["1fdhgjhj","2sgdfh","3dghfghcj","4fdhjgx","5zdgfhcg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //pickerview assign
        insurancePickerView.isHidden = true
        insurancePickerView.delegate = self
        insurancePickerView.dataSource = self
        /*
         //back Button design
         backButton.layer.borderWidth = 1
         backButton.layer.borderColor = DesignColor.shared.getUIColor(hex: "#2122C")?.cgColor
         backButton.layer.cornerRadius = 7
         backButton.layer.masksToBounds = true
         backButton.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMaxYCorner]
         */
        insurancePickerView.layer.borderWidth = 1
        insurancePickerView.layer.borderColor = DesignColor.shared.getUIColor(hex: "#E5E7E9")?.cgColor
        insurancePickerView.layer.cornerRadius = 10
        insurancePickerView.layer.masksToBounds = true
        
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
        
        seviceLabel.text = ComformAppointmentDetails.shared.service
        dateLabel.text = ComformAppointmentDetails.shared.date + "," + ComformAppointmentDetails.shared.time[0]
        remainingTime.text = ComformAppointmentDetails.shared.remainingTime
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //appointment default is for
        selectFamilyMember.text = ComformAppointmentDetails.shared.appointmentfor
        
    }
    // schedule comform button
    @IBAction func conformationButton(_ sender: Any) {
        ComformAppointmentDetails.shared.payingType = insuranceLabel1
        ComformAppointmentDetails.shared.insuranceInfo = insuranceInformation.text!
        if insuranceButton1.isSelected == true  || insuranceButton2.isSelected == true {
            if insuranvceButton3.isSelected == true || insurance4.isSelected == true {
                if  (insuranceInformation.text?.isEmpty)! == false{
                    let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment5") as! ScheduleConfirmViewController
                    self.present(navigate, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment3") as! DateTimeViewController
        self.present(navigate, animated: true, completion: nil)
        
    }
    //insurance radio button actions
    @IBAction func insuranceButton2(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            
        }
        else{
            sender.isSelected = true
            insuranceButton1.isSelected = false
            insuranceLabel1 = "Pay with Insurance"
        }
        
    }
    @IBAction func insuranceButton1(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            
        }
        else{
            sender.isSelected = true
            insuranceButton2.isSelected = false
            insuranceLabel1 = "Paying Self"
        }
    }
    @IBAction func insuranceButton3(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            
        }
        else{
            
            sender.isSelected = true
            insurance4.isSelected = false
            insuranceLabel2 = "Select from Existing"
            insuranceButton.isHidden = false
            
        }
        
    }
    @IBAction func insuranceButton4(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            
        }
        else{
            sender.isSelected = true
            insuranvceButton3.isSelected = false
            insuranceLabel2 = "Add new Insurance details"
            insuranceButton.isHidden = true
            insurancePickerView.isHidden = true
        }
    }
    
    @IBAction func insuranceButton(_ sender: Any) {
        
        if(insurancePickerView.isHidden == true){
            insurancePickerView.isHidden = false
        }
        else{
            insurancePickerView.isHidden = true
        }
    }
    //appoint for selection button action
    @IBAction func selectfamilyMemberButton(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "appointment") as! AppointFamilyMemberViewController
        self.present(navigate,animated: true, completion: nil)
        
    }
}
// slection insurance picker view
extension SummaryViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        pickerView.subviews.forEach({
            $0.isHidden = $0.frame.height < 1.0
        })
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return insuranceArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return insuranceArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        insuranceInformation.text = insuranceArray[row]
    }
    
}


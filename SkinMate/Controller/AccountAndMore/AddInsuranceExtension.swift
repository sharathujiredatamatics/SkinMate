//
//  AddInsuranceExtension.swift
//  SkinMate
//
//  Created by Datamatics on 19/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Extension for Validate add insurance textfield.
extension AddInsuranceViewController{
    func checkInsurance(){
        errorInsurance.text = ""
        insuranceDetails.layer.borderWidth = 1.0
        insuranceDetails.layer.masksToBounds = true
        insuranceDetails.layer.borderColor = UIColor.lightGray.cgColor
        validInsurance = false
        validCredentials()
        
    }
    func checkInsuranceEnd(){
        if insuranceDetails.text == ""{
            errorInsurance.text = "Enter Insurance Details"
            insuranceDetails.layer.borderWidth = 1.0
            insuranceDetails.layer.masksToBounds = true
            insuranceDetails.layer.borderColor = UIColor.red.cgColor
            validInsurance = false
            validCredentials()
        }
        else{
            errorInsurance.text = ""
            insuranceDetails.layer.borderWidth = 1.0
            insuranceDetails.layer.masksToBounds = true
            insuranceDetails.layer.borderColor = UIColor.lightGray.cgColor
            validInsurance = true
            validCredentials()
            
        }
    }
    func validCredentials(){
        if validInsurance == true {
            addInsuranceButton.isEnabled = true
            addInsuranceButton.alpha  = 1.0
        }
        else{
            addInsuranceButton.isEnabled = false
            addInsuranceButton.alpha  = 0.5
        }
    }
}

//
//  ValidationForgotPassword.swift
//  SkinMate
//
//  Created by Datamatics on 07/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation
extension ForgotPasswordViewController{
    func checkUserId() {
        if phoneNumberField.text == "" {
            errorPhoneNumber.text = "Please Enter Phone Number or Email"
            validUserId = false
            validUserPassword()
        } else if let validData = phoneNumberField.text, validData.isValidPhone() == true || validData.isValidEmail() == true {
            errorPhoneNumber.text = " "
            validUserId = true
            validUserPassword()
            return
        }
        else{
            errorPhoneNumber.text = "Please Enter a Valid Phone Number or Email"
            validUserId = false
            validUserPassword()
        }
    }
    func validUserPassword(){
        if validUserId == true {
            continueForgotPasswordButton.isEnabled = true
            continueForgotPasswordButton.alpha  = 1.0
        }
        else{
            continueForgotPasswordButton.isEnabled = false
            continueForgotPasswordButton.alpha  = 0.5
        }
    }
}


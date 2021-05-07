//
//  ValidationPassword.swift
//  SkinMate
//
//  Created by Datamatics on 07/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation
extension NewPasswordViewController{
    func checkPassword(){
        let isValidPassword = validPassword(password: password.text!)
        if password.text == "" {
            errorPassword.text = "Enter password"
            validPassword = false
            validUserPassword()
        } else if (isValidPassword == true) {
            errorPassword.text = ""
            validPassword = true
            
            validUserPassword()
            return
        }else{
            errorPassword.text = "Invalid Phone Number/Password Combination"
            validPassword = false
            validUserPassword()
        }
    }
    func checkConfirmPassword(){
        if confirmPassword.text == "" {
            errorConfirmPassword.text = "Enter Confirm password"
            validConfimPassword = false
            validUserPassword()
        }
    }
    public func validPassword(password: String) -> Bool {
        let pass = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$"
        let trimmedString = password.trimmingCharacters(in: .whitespaces)
        let validatePass = NSPredicate(format: "SELF MATCHES %@", pass)
        let isValidPassword = validatePass.evaluate(with: trimmedString)
        return isValidPassword
    }
    func validUserPassword(){
        if validPassword == true && validConfimPassword == true{
            changePasswordButton.isEnabled = true
            changePasswordButton.alpha  = 1.0
        }
        else{
            changePasswordButton.isEnabled = false
            changePasswordButton.alpha  = 0.5
        }
    }
}

//
//  ValidationPassword.swift
//  SkinMate
//
//  Created by Datamatics on 07/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Extension of NewPasswordViewController to validate password combination.
extension NewPasswordViewController{
    func checkPassword(){
        errorPassword.text = ""
        password.layer.borderWidth = 1.0
        password.layer.masksToBounds = true
        password.layer.borderColor = UIColor.lightGray.cgColor
        validPassword = false
        validUserPassword()
    }
    func checkPasswordEnd(){
        let isValidPassword = validPassword(password: password.text!)
        if password.text == "" {
            errorPassword.text = "Enter password"
            password.layer.borderWidth = 1.0
            password.layer.masksToBounds = true
            password.layer.borderColor = UIColor.red.cgColor
            validPassword = false
            validUserPassword()
        } else if (isValidPassword == true) {
            errorPassword.text = ""
            password.layer.borderWidth = 1.0
            password.layer.masksToBounds = true
            password.layer.borderColor = UIColor.lightGray.cgColor
            validPassword = true
            
            validUserPassword()
            return
        }else{
            errorPassword.text = "Invalid Password Combination"
            password.layer.borderWidth = 1.0
            password.layer.masksToBounds = true
            password.layer.borderColor = UIColor.red.cgColor
            validPassword = false
            validUserPassword()
        }
    }
    func checkConfirmPassword(){
        errorConfirmPassword.text = ""
        confirmPassword.layer.borderWidth = 1.0
        confirmPassword.layer.masksToBounds = true
        confirmPassword.layer.borderColor = UIColor.lightGray.cgColor
        validConfimPassword = false
        validUserPassword()
    }
    func checkConfirmPasswordEnd(){
        if confirmPassword.text == "" {
            errorConfirmPassword.text = "Enter Confirm Password"
            confirmPassword.layer.borderWidth = 1.0
            confirmPassword.layer.masksToBounds = true
            confirmPassword.layer.borderColor = UIColor.red.cgColor
            validConfimPassword = false
            validUserPassword()
        }
        else if confirmPassword.text == password.text{
            errorConfirmPassword.text = ""
            confirmPassword.layer.borderWidth = 1.0
            confirmPassword.layer.masksToBounds = true
            confirmPassword.layer.borderColor = UIColor.lightGray.cgColor
            validConfimPassword = true
        }
        else if confirmPassword.text != password.text{
            errorConfirmPassword.text = "Password Do Not Match"
            confirmPassword.layer.borderWidth = 1.0
            confirmPassword.layer.masksToBounds = true
            confirmPassword.layer.borderColor = UIColor.red.cgColor
            validConfimPassword = true
        }
    }
    public func validPassword(password: String) -> Bool {
        let pass = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
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

//
//  ChangePasswordExtension.swift
//  SkinMate
//
//  Created by Datamatics on 10/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
extension ChangePasswordViewController{
    func checkCurrentPassword(){
        let isValidPassword = validPassword(password: currentPassword.text!)
        if currentPassword.text == "" {
            errorCurrentPassword.text = "Enter Current password"
            currentPassword.layer.borderWidth = 0.50
            currentPassword.layer.masksToBounds = true
            currentPassword.layer.borderColor = UIColor.red.cgColor
            validCurrentPassword = false
            validUserPassword()
        } else if (isValidPassword == true) {
            errorCurrentPassword.text = ""
            currentPassword.layer.borderWidth = 0.15
            currentPassword.layer.masksToBounds = true
            currentPassword.layer.borderColor = UIColor.lightGray.cgColor
            validCurrentPassword = true
            validUserPassword()
            return
        }else{
            errorCurrentPassword.text = "Invalid Password Combination"
            currentPassword.layer.borderWidth = 0.50
            currentPassword.layer.masksToBounds = true
            currentPassword.layer.borderColor = UIColor.red.cgColor
            validCurrentPassword = false
            validUserPassword()
        }
    }
    func checkPassword(){
        let isValidPassword = validPassword(password: password.text!)
        if password.text == "" {
            errorPassword.text = "Enter password"
            password.layer.borderWidth = 0.50
            password.layer.masksToBounds = true
            password.layer.borderColor = UIColor.red.cgColor
            validPassword = false
            validUserPassword()
        } else if (isValidPassword == true) {
            errorPassword.text = ""
            password.layer.borderWidth = 0.15
            password.layer.masksToBounds = true
            password.layer.borderColor = UIColor.lightGray.cgColor
            validPassword = true
            
            validUserPassword()
            return
        }else{
            errorPassword.text = "Invalid Password Combination"
            password.layer.borderWidth = 0.50
            password.layer.masksToBounds = true
            password.layer.borderColor = UIColor.red.cgColor
            validPassword = false
            validUserPassword()
        }
    }
    func checkConfirmPassword(){
        if confirmPassword.text == "" {
            errorConfirmPassword.text = "Enter Confirm Password"
            confirmPassword.layer.borderWidth = 0.50
            confirmPassword.layer.masksToBounds = true
            confirmPassword.layer.borderColor = UIColor.red.cgColor
            validConfimPassword = false
            validUserPassword()
        }
        else if confirmPassword.text == password.text{
            errorConfirmPassword.text = ""
            confirmPassword.layer.borderWidth = 0.15
            confirmPassword.layer.masksToBounds = true
            confirmPassword.layer.borderColor = UIColor.lightGray.cgColor
            validConfimPassword = true
        }
        else if confirmPassword.text != password.text{
            errorConfirmPassword.text = "Password Do Not Match"
            confirmPassword.layer.borderWidth = 0.50
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
        if validPassword == true && validConfimPassword == true && validCurrentPassword == true{
            changePasswordButton.isEnabled = true
            changePasswordButton.alpha  = 1.0
        }
        else{
            changePasswordButton.isEnabled = false
            changePasswordButton.alpha  = 0.5
        }
    }
}


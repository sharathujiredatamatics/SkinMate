//
//  Validation.swift
//  SkinMate
//
//  Created by Datamatics on 06/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation
extension SignInViewController {
    
    func checkUserId() {
        if signInPhoneNumberFiled.text == "" {
            phoneNumberError.text = "Please Enter Phone Number or Email"
            validUserId = false
            validUserPassword()
        } else if let validData = signInPhoneNumberFiled.text, validData.isValidPhone() || validData.isValidEmail() {
             phoneNumberError.text = ""
            validUserId = true
            validUserPassword()
            return
        }else{
            phoneNumberError.text = "Please Enter a Valid Phone Number or Email"
            validUserId = false
            validUserPassword()
        }
    }
    func checkPassword(){
        let isValidPassword = validPassword(password: signInPasswordField.text!)
        if signInPasswordField.text == "" {
            passwordError.text = "Enter password"
            validPassword = false
            validUserPassword()
        } else if (isValidPassword == true) {
            passwordError.text = ""
            validPassword = true
            
            validUserPassword()
            return
        }else{
            passwordError.text = "Invalid Phone Number/Password Combination"
            validPassword = false
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
        if validUserId == true && validPassword == true{
            signInButton.isEnabled = true
            signInButton.alpha  = 1.0
        }
        else{
            signInButton.isEnabled = false
            signInButton.alpha  = 0.5
        }
    }
    
}

extension String {
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,3})$", options: .caseInsensitive)
        let valid = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        print("Email validation \(valid)")
        return valid
    }
    
    // vrify Valid PhoneNumber or Not
    func isValidPhone() -> Bool {
        
        let regex = try! NSRegularExpression(pattern: "^[0-9]\\d{9}$", options: .caseInsensitive)
        let valid = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        print("Mobile validation \(valid)")
        return valid
    }
//    func isValidPassword() -> Bool {
//        let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$", options: .caseInsensitive)
//        let valid = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
//        return valid
//    }

}

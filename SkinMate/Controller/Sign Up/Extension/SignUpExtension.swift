//
//  Validation.swift
//  DermitologyApplication
//
//  Created by techjini on 03/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation

extension  SignupViewController {
    
    //MARK:- TextField Validations
    func checkPhone(){
        let isValidPhone = isValidPhoneNumber(UserPhone: txtPhone.text!)
        if txtPhone.text == "" {
            lblPhoneError.text = "Please enter valid number"
            txtPhone.layer.borderWidth = 1.0
            txtPhone.layer.masksToBounds = true
            txtPhone.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            validPhone = false
            validCredentials()
        } else if (isValidPhone == true) {
            lblPhoneError.text = ""
            txtPhone.layer.borderWidth = 1.0
            txtPhone.layer.masksToBounds = true
            txtPhone.layer.borderColor =  #colorLiteral(red: 0.8, green: 0.8156862745, blue: 0.8352941176, alpha: 1)
            validPhone = true
            
            validCredentials()
            return
        }else{
            lblPhoneError.text = "Invalid Phone Number"
            txtPhone.layer.borderWidth = 1.0
            txtPhone.layer.masksToBounds = true
            txtPhone.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            validPhone = false
            validCredentials()
        }
    }
    
    func checkEmail(){
        let isValidEmail = validEmail(email: txtEmail.text!)
        if txtEmail.text == "" {
            lblEmailError.text = "Enter valid Email Id"
            txtEmail.layer.borderWidth = 1.0
            txtEmail.layer.masksToBounds = true
            txtEmail.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            validEmail = false
            validCredentials()
        } else if isValidEmail == true {
            lblEmailError.text = ""
            txtEmail.layer.borderWidth = 1.0
            txtEmail.layer.masksToBounds = true
            txtEmail.layer.borderColor =  #colorLiteral(red: 0.8, green: 0.8156862745, blue: 0.8352941176, alpha: 1)
            validEmail = true
            validCredentials()
            return
        }else{
            lblEmailError.text = "Invalid Email Id"
            txtEmail.layer.borderWidth = 1.0
            txtEmail.layer.masksToBounds = true
            txtEmail.layer.borderColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            validEmail = false
            validCredentials()
            return
        }
    }
    
    
    
    
    
    func checkPass(){
        let isValidPassword = isValidPass(UserPass: txtPassword.text!)
        if txtPassword.text == "" {
            lblPassError.text = "Invalid Password"
            txtPassword.layer.borderWidth = 1.0
            txtPassword.layer.masksToBounds = true
            txtPassword.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            validPass = false
            validCredentials()
        } else if (isValidPassword == true)  {
            lblPassError.text = ""
            txtPassword.layer.borderWidth = 1.0
            txtPassword.layer.masksToBounds = true
            txtPassword.layer.borderColor = #colorLiteral(red: 0.8, green: 0.8156862745, blue: 0.8352941176, alpha: 1)
            validPass = true
            validCredentials()
            
            return
        }else{
            lblPassError.text = "Enter valid Password must contain numerics and symbols"
            txtPassword.layer.borderWidth = 1.0
            txtPassword.layer.masksToBounds = true
            txtPassword.layer.borderColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            validPass = false
            
            validCredentials()
            return
        }
    }
    
    
    
    func confirmPass(){
        let isValidPassword = isValidPass(UserPass: txtConfirm.text!)
        if txtConfirm.text == "" {
            lblConfirmError.text = "Invalid Password"
            txtConfirm.layer.borderWidth = 1.0
            txtConfirm.layer.masksToBounds = true
            txtConfirm.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            validConPass = false
            validCredentials()
        } else if (isValidPassword == true) && txtConfirm.text == txtPassword.text{
            lblConfirmError.text = ""
            txtConfirm.layer.borderWidth = 1.0
            txtConfirm.layer.masksToBounds = true
            txtConfirm.layer.borderColor = #colorLiteral(red: 0.8, green: 0.8156862745, blue: 0.8352941176, alpha: 1)
            validConPass = true
            validCredentials()
            
            return
        }else{
            lblConfirmError.text = "Password doesn't match"
            txtConfirm.layer.borderWidth = 1.0
            txtConfirm.layer.masksToBounds = true
            txtConfirm.layer.borderColor =  #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            validConPass = false
            validCredentials()
            return
        }
    }
    
    public func validEmail(email: String) -> Bool {
        let emailId = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,3})$"
        let trimmedString = email.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format: "SELF MATCHES %@", emailId)
        let isValidEmail = validateEmail.evaluate(with: trimmedString)
        return isValidEmail
    }
    
    public   func isValidPass(UserPass: String) -> Bool {
        var returnValue = true
        let PassRegx = "^(?=.*[a-z])(?=.*[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        do {
            let regex = try NSRegularExpression(pattern: PassRegx)
            let nsString = UserPass as NSString
            let results = regex.matches(in:  UserPass, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    public func isValidPhoneNumber(UserPhone: String) -> Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: UserPhone, options: [], range:NSMakeRange(0,UserPhone.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == UserPhone.count && UserPhone.count == 10
                
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func validCredentials() {
        if validEmail == true && validPass == true && validPhone == true && validConPass == true{
            btnProceed.isEnabled = true
            btnProceed.alpha  = 1.0
            btnProceed.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        }
        else{
            
            btnProceed.isEnabled = false
            btnProceed.alpha  = 0.5
        }
    }
}





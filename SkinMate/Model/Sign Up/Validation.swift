//
//  Validation.swift
//  DermitologyApplication
//
//  Created by techjini on 03/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation

class  Validation {
    
    static let shared = Validation()
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
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
    
    
    func isValidPass(UserPass: String) -> Bool {
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
    
    func isValidPhoneNumber(UserPhone: String) -> Bool {
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
}





//
//  ForgotPasswordViewControllerExtension.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
extension ForgotPasswordViewController{
    func changePasswordRequest(userIdEmail : String,userIdPhone : String){
        var parameters: [String : Any] = [:]
        if userIdEmail == ""{
            parameters = ["phone": userIdPhone]
        }
        else{
            parameters = ["email": userIdEmail]
        }
        VerifyForgotPasswordRequest.shared.phoneNumber = userIdPhone
        VerifyForgotPasswordRequest.shared.emailId = userIdEmail
        if let url = URL(string: SignInAPI.shared.forgotPasswordRequest){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            //            let parameters: [String : Any] = [
            //                "email": userIdEmail,
            //                "phone": userIdPhone,
            //                "password": password
            //            ]
            //request.setValue(SystemVerification.shared.userAgent, forHTTPHeaderField: "user-agent")
//            request.httpBody = parameters.percentEscaped().data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    //                    guard (400 ... 500) ~= response.statusCode else {
                    let statusCode = response.statusCode
                    print("Status code :- \(statusCode)")
                    
                    
                    if statusCode == 403{
                        DispatchQueue.main.async {
                            self.alert(tittle: "Alert", message: " Requires user-agent")
                        }
                    }
                    else if statusCode == 404{
                        DispatchQueue.main.async {
                            self.errorPhoneNumber.text = "User doesn't exist"
                        }
                    }
                    else if statusCode == 500{
                        DispatchQueue.main.async {
                            self.errorPhoneNumber.text = "Couldn't generate OTP"
                        }
                    }
                    }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    print(json!)
                    SignInAPICall.shared.requestId = "\(json!["_id"]!)"
                    DispatchQueue.main.async {
                    let verifyForgotPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "VerifyForgotPasswordViewController") as! VerifyForgotPasswordViewController
                    verifyForgotPasswordViewController.number = self.phoneNumberField.text!
                    self.present(verifyForgotPasswordViewController, animated: true)
                    }
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

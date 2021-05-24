//
//  VerifyForgotPasswordRequest.swift
//  SkinMate
//
//  Created by Datamatics on 10/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Singleton class to to get verify email request code using API call.
class VerifyForgotPasswordRequest{
    static let shared = VerifyForgotPasswordRequest()
    init() {
    }
    var phoneNumber = String()
    var emailId = String()
    func changePasswordRequest(){
        var parameter = String()
        //var parameters: [String : Any] = [:]
        
        if VerifyForgotPasswordRequest.shared.emailId == ""{
            parameter = "?phone=\(VerifyForgotPasswordRequest.shared.phoneNumber)"
            //parameters = ["phone" : VerifyForgotPasswordRequest.shared.phoneNumber ]
        }
        else{
            parameter = "?email=\(VerifyForgotPasswordRequest.shared.emailId)"
            //parameters = ["email" : VerifyForgotPasswordRequest.shared.emailId]
        }
        
        if let url = URL(string: "\(SignInAPI.shared.forgotPasswordRequest)\(parameter)"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            //request.httpBody = parameters.percentEscaped().data(using: .utf8)
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
                            //                    self.alert(tittle: "Alert", message: " Requires user-agent")
                        }
                    }
                    else if statusCode == 404{
                        DispatchQueue.main.async {
                            //                    self.errorPhoneNumber.text = "User doesn't exist"
                        }
                    }
                    else if statusCode == 500{
                        DispatchQueue.main.async {
                            //                    self.errorPhoneNumber.text = "Couldn't generate OTP"
                        }
                    }
                    
                }
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    //print(json!)
                    SystemVerification.shared.requestId = "\(json!["_id"]!)"
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

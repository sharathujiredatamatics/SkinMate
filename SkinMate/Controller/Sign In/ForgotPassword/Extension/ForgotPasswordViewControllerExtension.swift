//
//  ForgotPasswordViewControllerExtension.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Requesting for password change API Call.
extension ForgotPasswordViewController{
    func changePasswordRequest(userIdEmail : String,userIdPhone : String){
        var parameter = String()
        //var parameters: [String : Any] = [:]
        if userIdEmail == ""{
            parameter = "?phone=\(userIdPhone)"
           // parameters = ["phone":userIdPhone]
            self.userInfo = userIdPhone
        }
        else{
            parameter = "?email=\(userIdEmail)"
            //parameters = ["email":userIdEmail]
            self.userInfo = userIdEmail
        }
        VerifyForgotPasswordRequest.shared.phoneNumber = userIdPhone
        VerifyForgotPasswordRequest.shared.emailId = userIdEmail
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
                    print(response.statusCode)
                    if response.statusCode == 200 {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            let verifyForgotPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "VerifyForgotPasswordViewController") as! VerifyForgotPasswordViewController
                            verifyForgotPasswordViewController.number = self.userInfo
                            self.navigationController?.pushViewController(verifyForgotPasswordViewController, animated: false)
                        }
                    }
                    else if response.statusCode == 404 {
                        DispatchQueue.main.async {
                            self.errorPhoneNumber.text = "User Data Not Found"
                            self.phoneNumberField.layer.borderWidth = 1.0
                            self.phoneNumberField.layer.masksToBounds = true
                            self.phoneNumberField.layer.borderColor = UIColor.red.cgColor
                        }
                    }
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    SystemVerification.shared.requestId = "\(json!["_id"]!)"
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

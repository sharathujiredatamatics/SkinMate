//
//  SignInViewControllerExtension.swift
//  SkinMate
//
//  Created by Datamatics on 06/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API Call Extension to sign in purpose.
extension SignInViewController{
    func signIn(userIdEmail : String,userIdPhone : String, password : String){
        var parameters = String()
        if userIdEmail == ""{
            parameters = "phone=\(userIdPhone)&password=\(password)"
            KeychainWrapper.standard.set(password, forKey: "userPassword")
            
        }
        else{
            parameters = "email=\(userIdEmail)&password=\(password)"
            KeychainWrapper.standard.set(password, forKey: "userPassword")
            
        }
        if let url = URL(string: SignInAPI.shared.signInAPI){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = parameters.data(using: String.Encoding.utf8)
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
                            self.passwordError.text = "Account not found"
                        }
                    }
                    else if statusCode == 500{
                        DispatchQueue.main.async {
                            self.passwordError.text = "Couldn't verify password"
                        }
                    }
                    else if statusCode == 401{
                        DispatchQueue.main.async {
                            self.passwordError.text = "Incorrect password"
                            
                        }
                    }
                    else if statusCode == 500{
                        DispatchQueue.main.async {
                            self.passwordError.text = "Couldn't authenticate"
                        }
                    }
                    
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    SystemVerification.shared.deviceId = "\(json!["_id"]!)"
                    SystemVerification.shared.tokenId = "\(json!["token"]!)"
                    SystemVerification.shared.userAgent = "\(json!["userAgent"]!)"
                    
                    FetchUserDetails.shared.fetchUserDetails(tokenId: "\(json!["token"]!)", deviceId: "\(json!["_id"]!)")
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

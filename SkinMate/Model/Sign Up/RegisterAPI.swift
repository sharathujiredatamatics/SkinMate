//
//  RegisterAPI.swift
//  DermitologyApplication
//
//  Created by techjini on 04/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation
import UIKit

class RegisterAPI {
    
    var delegate: navigate!
    
    static let shared = RegisterAPI()
    
    func setupPostMethod(PhoneNo: String,Email: String,Password: String){
        var parameters = String()
        parameters = "email=\(Email)&password=\(Password)&phone=\(PhoneNo)"
        
        
        // https://jsonplaceholder.typicode.com/posts/
        if let url = URL(string: "https://skinmate.herokuapp.com/accounts"){
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
                    if response.statusCode == 409 {
                        DispatchQueue.main.async {
                            self.delegate.existAlert()
                        }
                        
                    }
                    else if response.statusCode == 406 {
                        DispatchQueue.main.async {
                            self.delegate.errorAlert()
                            
                        }
                        
                    }
                    else if response.statusCode == 500 {
                        DispatchQueue.main.async {
                            self.delegate.validationAlert()
                        }
                        
                    } else {
                        DispatchQueue.main.async {
                            
                            self.delegate.pushToOtpController()
                        }
                    }
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    print(json!)
                    
                    print(" device Id: \(json!["_id"]!)")
                    print(" token ID: \(json!["token"]!)")
                    SystemVerification.shared.deviceId = "\(json!["_id"]!)"
                    SystemVerification.shared.tokenId = "\(json!["token"]!)"
                    
                    RequestAPI.shared.setupPostMethod(deviceID: SystemVerification.shared.deviceId, tokenId: SystemVerification.shared.tokenId)
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
        
    }
    
}




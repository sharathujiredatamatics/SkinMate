//
//  VerifyAPI.swift
//  DermitologyApplication
//
//  Created by techjini on 04/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation
import  UIKit
class VerifyAPI {
    
    var delegate1: navigation!
    
    let otp = OtpEnterViewController()
    
    static let shared = VerifyAPI()
    
    func setupPostMethod(Code: Int,Id: String,deviceID: String,tokenId: String) {
        
        
        if let url = URL(string: "https://skinmate.herokuapp.com/accounts/verify/phone") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            request.setValue(deviceID, forHTTPHeaderField: "device-id")
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            
            request.setValue(tokenId, forHTTPHeaderField: "access-token")
            //   request.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
            let parameters: [String : Any] = [
                "code": Code,
                "requestId": Id,
                
                ]
            
            request.httpBody = parameters.percentEscaped().data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse {
                    print("\(response.statusCode)")
                    if response.statusCode == 200 {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            self.delegate1.pushToSuccessController()
                        }
                        
                    } else {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            self.delegate1.pushToInvalidController()
                        }
                    }
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? String
                    print(json!)
                    
                } catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
            
        }
    }
    
}





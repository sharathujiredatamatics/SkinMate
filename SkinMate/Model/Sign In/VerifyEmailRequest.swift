//
//  VerifyEmail.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation
// Singleton class to request for verify email using API Call.
class VerifyEmailRequest{
    static let shared = VerifyEmailRequest()
    init() {
    }
    
    func verifyEmail(tokenId : String, deviceId : String){
        if let url = URL(string: SignInAPI.shared.verifyEmail){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(deviceId, forHTTPHeaderField: "device-id")
            request.setValue(tokenId, forHTTPHeaderField: "access-token")
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    guard (200 ... 299) ~= response.statusCode else {
                        print("Status code :- \(response.statusCode)")
                        print(response)
                        
                        return
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


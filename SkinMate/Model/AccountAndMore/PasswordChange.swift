//
//  PasswordChange.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API Call to change user account password.
class PasswordChange {
    static let shared = PasswordChange()
    init() {
    }
    
    func passwordChange(password : String){
        var parameters = String()
        parameters = "password=\(password)"
        if let url = URL(string: AccountAPI.shared.userUpdate){
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
            request.setValue(SystemVerification.shared.deviceId, forHTTPHeaderField: "device-id")
            request.setValue(SystemVerification.shared.tokenId, forHTTPHeaderField: "access-token")
            
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = parameters.data(using: String.Encoding.utf8)
            //request.httpBody = parameters.data(using: .utf8)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    if response.statusCode == 200 {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            KeychainWrapper.standard.set(password, forKey: "userPassword")
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadPasswordUpdateViewController"), object: nil)
                        }
                    } else {
                        print("\(response.statusCode)")
                    }
                }
                
                do{
                    let _ = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

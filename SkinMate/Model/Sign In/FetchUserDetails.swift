//
//  FetchUserDetails.swift
//  SkinMate
//
//  Created by Datamatics on 09/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Singleton class to fetch user information from server using API call.
class FetchUserDetails{
    static let shared = FetchUserDetails()
    init() {
    }
    func fetchUserDetails(tokenId : String, deviceId : String){
        if let url = URL(string: SignInAPI.shared.fetchUserAPI){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(deviceId, forHTTPHeaderField: "device-id")
            request.setValue(tokenId, forHTTPHeaderField: "access-token")
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    let statusCode = response.statusCode
                    print("Status code :- \(statusCode)")
                    if statusCode == 403{
                        DispatchQueue.main.async {
                            VerifyEmailRequest.shared.verifyEmail(tokenId: SystemVerification.shared.tokenId, deviceId: SystemVerification.shared.deviceId)
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadVerifyEmailViewController"), object: nil)
                        }
                    }
                    
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    // Storing user information to signleton class.
                    UserDetails.shared.userId = "\(json!["_id"]!)"
                    UserDetails.shared.email = "\(json!["email"]!)"
                    UserDetails.shared.phone = "\(json!["phone"]!)"
                    UserDetails.shared.firstName = "\(json!["firstName"]!)"
                    UserDetails.shared.lastName = "\(json!["lastName"]!)"
                    UserDetails.shared.gender = "\(json!["gender"]!)"
                    UserDetails.shared.dateOfBirth = "\(json!["dateOfBirth"]!)"
                    UserDetails.shared.bloodGroup = "\(json!["bloodGroup"]!)"
                    UserDetails.shared.address   = "\(json!["address"]!)"
                    UserDetails.shared.insurance = "\(json!["insurance"]!)"
                    UserDetails.shared.emergencyName = "\(json!["emergencyName"]!)"
                    UserDetails.shared.emergencyNumber = "\(json!["emergencyNumber"]!)"
                    DispatchQueue.main.async {
                        // Storing userId, tokenId and deviceId to Keychain.
                        KeychainWrapper.standard.set("\(json!["phone"]!)", forKey: "userId")
                        KeychainWrapper.standard.set(SystemVerification.shared.tokenId, forKey: "tokenId")
                        KeychainWrapper.standard.set(SystemVerification.shared.deviceId, forKey: "deviceId")
        
                        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                        UserDefaults.standard.synchronize()
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadMainTabViewController"), object: nil)
                    }
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}


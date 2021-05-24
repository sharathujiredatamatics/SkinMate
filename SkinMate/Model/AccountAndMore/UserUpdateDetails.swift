//
//  UserUpdateDetails.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API Call to upadte user information.
class UserDetailsUpdate {
    static let shared = UserDetailsUpdate()
    init() {
    }
    func userUpdateDetails(address: String, insurance:String, eName: String, eNumber:String){
        var parameters = String()
        parameters = "address=\(address)&insurance=\(insurance)&emergencyName=\(eName)&emergencyNumber=\(eNumber)"
      
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
                    } else {
                        print("\(response.statusCode)")
                    }
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    // Stotring User informatio from server.
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
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadUserUpdateViewController"), object: nil)
                    }
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

//
//  CreateAPI.swift
//  DermitologyApplication
//
//  Created by techjini on 04/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation


class CreateAPI {
    static let shared = CreateAPI()
    
    var arr = String()

            
    func setupPostMethod(Fname: String,Lname: String,Gender:String,DBirth: String,Bgroup:String,address: String,Insur:String,Ename: String,Enumber:String,deviceID: String, tokenId: String){
        print(Lname)
        var parameters = String()
        parameters = "firstName=\(Fname)&lastName=\(Lname)&gender=\(Gender)&dateOfBirth=\(DBirth)&bloodGroup=\(Bgroup)&address=\(address)&insurance=\(Insur)&emergencyName=\(Ename)&emergencyNumber=\(Enumber)"
        
        if let url = URL(string: "https://skinmate.herokuapp.com/accounts"){
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
            request.setValue(SystemVerification.shared.deviceId, forHTTPHeaderField: "device-id")
            request.setValue(SystemVerification.shared.tokenId, forHTTPHeaderField: "access-token")
            
            
            
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
                    
                    print(json!)
                    
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSignUpSuccessViewController"), object: nil)
                        IQKeyboardManager.shared.enable = true
                    }
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}






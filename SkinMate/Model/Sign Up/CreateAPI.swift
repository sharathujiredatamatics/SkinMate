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
    
    func setupPostMethod(Fname: String,Lname: String,Gender:String,DBirth: Date,Bgroup:String,address: String,Insur:String,Ename: String,Enumber:String,deviceID: String, tokenId: String){
        
        // https://jsonplaceholder.typicode.com/posts/
        if let url = URL(string: "https://skinmate.herokuapp.com/accounts"){
            var request = URLRequest(url: url)
            
            request.setValue(deviceID, forHTTPHeaderField: "device-id")
            
            request.setValue(tokenId, forHTTPHeaderField: "access-token")
            
            
            request.httpMethod = "PATCH"
            //   request.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
            let parameters: [String : Any] = [
                "firstName": Fname,
                "lastName": Lname,
                "gender": Gender,
                "dateOfBirth":DBirth,
                "bloodGroup":Bgroup,
                "address":address,
                "insurance":Insur,
                "emergencyName":Ename,
                "emergencyNumber":Enumber
            ]
            
            request.httpBody = parameters.percentEscaped().data(using: .utf8)
            
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
                    
                    
                    // print(id)
                    // print(token)
                    
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}






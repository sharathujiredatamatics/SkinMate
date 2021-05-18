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
    static let shared = RegisterAPI()
    
    let vc = SignupViewController()
    
    var arr = String()
    
    func setupPostMethod(PhoneNo: String,Email: String,Password: String){
        /* guard let uid = self.txtUID.text else { return }
         guard let title = self.txtTitle.text else { return }
         guard let body = self.txtBody.text else { return }*/
        // https://jsonplaceholder.typicode.com/posts/
        if let url = URL(string: "https://skinmate.herokuapp.com/accounts"){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            //   request.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
            let parameters: [String : Any] = [
                "email": Email,
                "password": Password,
                "phone": PhoneNo
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
                    /* guard (200 ... 299) ~= response.statusCode else {
                     print("Status code :- \(response.statusCode)")
                     print(response)
                     
                     return
                     }*/
                    if response.statusCode == 409 {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Error", message: "user already exist", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action: UIAlertAction!) in
                                print("Okay")
                            }))
                            self.vc.present(alert,animated: true,completion: nil)
                        }
                        
                    }
                    else if response.statusCode == 406 {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Error", message: "Validation error", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action: UIAlertAction!) in
                                print("Okay")
                            }))
                            self.vc.present(alert,animated: true,completion: nil)
                            
                        }
                        
                    }
                    else if response.statusCode == 500 {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Error", message: "Could not register", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action: UIAlertAction!) in
                                print("Okay")
                            }))
                            self.vc.present(alert,animated: true,completion: nil)
                        }
                        
                    }
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    
                    print(json!)
                    
                    print(" device Id: \(json!["_id"]!)")
                    print(" token ID: \(json!["token"]!)")
                    Varification.shared.deviceID = "\(json!["_id"]!)"
                    Varification.shared.tokenId = "\(json!["token"]!)"
                    // print(id)
                    // print(token)
                    let savePassword: Bool = KeychainWrapper.standard.set(Password, forKey: Email)
                    let saveDeviceId: Bool = KeychainWrapper.standard.set(Varification.shared.deviceID, forKey: "deviceId\(Email)")
                    let saveTokenId: Bool = KeychainWrapper.standard.set(Varification.shared.tokenId, forKey: "tokenId\(Email)")
                    
                    print("Succesfull\(savePassword)")
                    print("Succesfull\(saveDeviceId)")
                    print("Succesfull\(saveTokenId)")
                    
                    
                    
                    RequestAPI.shared.setupPostMethod(deviceID: Varification.shared.deviceID, tokenId: Varification.shared.tokenId)
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
        
    }
    
    
}





extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}



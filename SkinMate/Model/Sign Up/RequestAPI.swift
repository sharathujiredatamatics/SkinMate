//
//  RequestAPI.swift
//  DermitologyApplication
//
//  Created by techjini on 04/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation

class RequestAPI {
    static let shared = RequestAPI()
    
    var arr = String()
    
    func setupPostMethod(deviceID: String,tokenId: String){
        /* guard let uid = self.txtUID.text else { return }
         guard let title = self.txtTitle.text else { return }
         guard let body = self.txtBody.text else { return }*/
        // https://jsonplaceholder.typicode.com/posts/
        if let url = URL(string: "https://skinmate.herokuapp.com/accounts/verify/phone"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            //   request.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
            request.setValue(deviceID, forHTTPHeaderField: "device-id")
            
            request.setValue(tokenId, forHTTPHeaderField: "access-token")
            
            // request.httpBody = parameters.percentEscaped().data(using: .utf8)
            
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
                    
                    print(json!)
                    Varification.shared.Id = "\(json!["_id"]!)"
                    print(Varification.shared.Id)
                    
                    
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}




/*extension Dictionary {
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
 }*/



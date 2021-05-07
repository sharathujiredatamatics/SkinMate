//
//  VerifyAPI.swift
//  DermitologyApplication
//
//  Created by techjini on 04/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

/*import Foundation
 
 
 class VarifyAPI {
 static let shared = VarifyAPI()
 
 var arr = String()
 var response = Bool()
 
 func setupPostMethod(Code: Int,Id: String,deviceID: String,tokenId: String) -> Bool {
 var result = Bool()
 
 // https://jsonplaceholder.typicode.com/posts/
 if let url = URL(string: "https://skinmate.herokuapp.com/accounts/verify/phone"){
 var request = URLRequest(url: url)
 request.httpMethod = "POST"
 
 request.setValue(deviceID, forHTTPHeaderField: "device-id")
 
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
 
 if let response = response as? HTTPURLResponse{
 print("\(response.statusCode)")
 if response.statusCode == 200 {
 Varification.shared.Status = response.statusCode
 } else {
 Varification.shared.Status = response.statusCode
 }
 }
 
 do{
 let json = try JSONSerialization.jsonObject(with: data, options: []) as? String
 
 
 print(json!)
 
 // print(" device Id: \(json!["_id"]!)")
 //    print(" token ID: \(json!["token"]!)")
 
 
 
 }catch let error{
 print(error.localizedDescription)
 
 }
 }.resume()
 
 
 }
 if Varification.shared.Status == 200 {
 result = true
 } else {
 result = false
 }
 return result
 
 }
 
 }*/







//
//  MemberInformation.swift
//  SkinMate
//
//  Created by Datamatics on 15/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//
import UIKit
class MemberInformation{
    static let shared = MemberInformation()
    init() {
    }
    //let deviceId: String? = KeychainWrapper.standard.string(forKey: "deviceId")
    //let tokenId: String? = KeychainWrapper.standard.string(forKey: "tokenId")
    var userId = String()
    var email = String()
    var phone = String()
    var firstName = String()
    var lastName = String()
    var relationship = String()
    var gender = String()
    var dateOfBirth  = String()
    var bloodGroup = String()
    var address = String()
    var insurance = String()
    var emergencyName = String()
    var emergencyNumber = String()
    
    func memberInformation(id : String){
        if let url = URL(string: "\(AccountAPI.shared.deleteFamilymember)\(id)"){
            print("\(AccountAPI.shared.deleteFamilymember)\(id)")
            var request = URLRequest(url: url)
            request.httpMethod = "Get"
            request.setValue(SystemVerification.shared.deviceId, forHTTPHeaderField: "device-id")
            request.setValue(SystemVerification.shared.tokenId, forHTTPHeaderField: "access-token")
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
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
                    MemberInformation.shared.userId = "\(json!["_id"]!)"
                    MemberInformation.shared.firstName = "\(json!["firstName"]!)"
                    MemberInformation.shared.lastName = "\(json!["lastName"]!)"
                    
                    MemberInformation.shared.gender = "\(json!["gender"]!)"
                    MemberInformation.shared.dateOfBirth = "\(json!["dateOfBirth"]!)"
                    MemberInformation.shared.relationship = "\(json!["relationship"]!)"
                    print("\(json!["dateOfBirth"]!)")
                    print(MemberInformation.shared.relationship)
                    MemberInformation.shared.bloodGroup = "\(json!["bloodGroup"]!)"
                    MemberInformation.shared.address   = "\(json!["address"]!)"
                    MemberInformation.shared.insurance = "\(json!["insurance"]!)"
                    MemberInformation.shared.emergencyName = "\(json!["emergencyName"]!)"
                    MemberInformation.shared.emergencyNumber = "\(json!["emergencyNumber"]!)"
                    print(UserDetails.shared.lastName)
                    
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

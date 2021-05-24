//
//  UserUpdateDetails.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API Call to Add Family member.
class AddFamilyMember {
    static let shared = AddFamilyMember()
    init() {
    }
    var gender = String()
    func addFamilyMember(fName: String, lName: String, relation : String, gender:String, dBirth: String, bGroup:String, address: String, insurance:String, eName: String, eNumber:String, viewController : UIViewController){
        var parameters = String()
        parameters = "firstName=\(fName)&lastName=\(lName)&gender=\(gender)&relationship=\(relation)&dateOfBirth=\(dBirth)&bloodGroup=\(bGroup)&address=\(address)&insurance=\(insurance)&emergencyName=\(eName)&emergencyNumber=\(eNumber)"
        if let url = URL(string: AccountAPI.shared.addFamily){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue(SystemVerification.shared.deviceId, forHTTPHeaderField: "device-id")
            request.setValue(SystemVerification.shared.tokenId, forHTTPHeaderField: "access-token")
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = parameters.data(using: String.Encoding.utf8)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    if response.statusCode == 201 {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            FamilyMembers.shared.familyMembersData = []
                            FamilyMembers.shared.loadAllFamilyMembers()
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSuceesAddFamilyViewController"), object: nil)
                            
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

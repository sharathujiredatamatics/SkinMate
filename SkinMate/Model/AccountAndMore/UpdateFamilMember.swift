//
//  UpdateFamilMmener.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API Call to update family member details.
class UpdateFamilyMember {
    static let shared = UpdateFamilyMember()
    init() {
    }
    
    func addFamilyMember(address: String, insurance:String, eName: String, eNumber:String){
        //        let deviceId: String? = KeychainWrapper.standard.string(forKey: "deviceId")
        //        let tokenId: String? = KeychainWrapper.standard.string(forKey: "tokenId")
        var parameters = String()
        parameters = "address=\(address)&insurance=\(insurance)&emergencyName=\(eName)&emergencyNumber=\(eNumber)"
        
        if let url = URL(string: "\(AccountAPI.shared.updateFamily)\(MemberInformation.shared.userId)"){
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
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
                    if response.statusCode == 200 {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            MemberInformation.shared.memberInformation(id: MemberInformation.shared.userId)
                            FamilyMembers.shared.familyMembersData = []
                            FamilyMembers.shared.loadAllFamilyMembers()
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSuceesUpdateFamilyViewController"), object: nil)
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
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


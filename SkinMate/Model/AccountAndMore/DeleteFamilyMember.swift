//
//  DeleteFamilyMembe.swift
//  SkinMate
//
//  Created by Datamatics on 15/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//
import UIKit
// API Call to delete a family member.
class DeleteFamilyMember{
    static let shared = DeleteFamilyMember()
    init() {
    }
    
    func deleteFamilyMember(id : String, index : Int){
        if let url = URL(string: "\(AccountAPI.shared.deleteFamilymember)\(id)"){
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
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
                    if response.statusCode == 200 {
                        print("\(response.statusCode)")
                        FamilyMembers.shared.familyMembersData.remove(at: index)
                        DispatchQueue.main.async {
                            //
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewControllerFromDeleteView"), object: nil)
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


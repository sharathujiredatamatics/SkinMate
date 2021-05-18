//
//  DeleteFamilyMembe.swift
//  SkinMate
//
//  Created by Datamatics on 15/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//
import UIKit
class DeleteFamilyMember{
    static let shared = DeleteFamilyMember()
    init() {
    }
    
    func deleteFamilyMember(id : String){
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
                    guard (200 ... 299) ~= response.statusCode else {
                        print("Status code :- \(response.statusCode)")
                        print(response)
                        
                        return
                    }
                }
                
                do{
                    DispatchQueue.main.async {
                    FamilyMembers.shared.familyMembersData = []
                    FamilyMembers.shared.loadAllFamilyMembers()
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewControllerFromDeleteView"), object: nil)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
                    }
                    
                }
                }.resume()
        }
    }
}


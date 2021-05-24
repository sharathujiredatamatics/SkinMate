//
//  FamilyMembers.swift
//  SkinMate
//
//  Created by Datamatics on 14/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API call to fetch all family members.
class FamilyMembers{
    static let shared = FamilyMembers()
    init() {
    }
    var familyMembersData = [FamilyMembersData]()
    var familyImages  = ["Member1","Member2","Member3","Member4","Member5","Member6","Member1","Member2","Member3","Member4","Member5","Member6","Member1","Member2","Member3","Member4","Member5","Member6","Member1","Member2","Member3","Member4","Member5","Member6","Member1","Member2","Member3","Member4","Member5","Member6",]
    func loadFamilyMembers(completion: @escaping ([FamilyMembersData]?, Error?) -> ()) {
        
        let url = URL(string: AccountAPI.shared.allFamilyMembers)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        print(SystemVerification.shared.deviceId)
        
        request.setValue(SystemVerification.shared.tokenId, forHTTPHeaderField: "access-token")
        request.setValue(SystemVerification.shared.deviceId, forHTTPHeaderField: "device-id")
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let err = error {
                completion(nil, err)
                return
            }
            
            if let response = response as? HTTPURLResponse{
                let statusCode = response.statusCode
                print("Status code :- \(statusCode)")
                
                
            }
            //successfull
            do {
                let jsonData = try JSONDecoder().decode([FamilyMembersData].self, from: data!)
                completion(jsonData, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
    func loadAllFamilyMembers(){
        FamilyMembers.shared.familyMembersData.removeAll()
        loadFamilyMembers() { (jsonData, error) in
            if let err = error {
                print(err)
                return
            }
            FamilyMembers.shared.familyMembersData.removeAll()
            jsonData?.forEach() { (value) in
                FamilyMembers.shared.familyMembersData.append(value)
            }
        }
    }
}

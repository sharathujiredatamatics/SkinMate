//
//  AllAppointment.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
class AllAppointments{
    static let shared = AllAppointments()
    init() {
    }
    
    
    var allAppointments = [AppointmentsData]()
 
    func loadAllAppointments(completion: @escaping ([AppointmentsData]?, Error?) -> ()) {
        
        let url = URL(string: MyAccountAPI.shared.fetchAllApointments)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
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
        
        loadFamilyMembers() { (jsonData, error) in
            if let err = error {
                print(err)
                return
            }
            jsonData?.forEach() { (value) in
                FamilyMembers.shared.familyMembersData.removeAll()
                FamilyMembers.shared.familyMembersData.append(value)
                print(value)
            }
        }
    }
}

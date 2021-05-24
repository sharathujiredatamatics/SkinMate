//
//  AllAppointment.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API call to fetch all appointments.
class AllAppointments{
    static let shared = AllAppointments()
    init() {
    }
    var allAppointments = [AppointmentsData]()
    
    func loadAllAppointment(completion: @escaping ([AppointmentsData]?, Error?) -> ()) {
        
        let url = URL(string: MyAppointmentAPI.shared.fetchAllApointments)
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
                let jsonData = try JSONDecoder().decode([AppointmentsData].self, from: data!)
                completion(jsonData, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
    func loadAllAppointments(){
        AllAppointments.shared.allAppointments.removeAll()
        loadAllAppointment() { (jsonData, error) in
            if let err = error {
                print(err)
                return
            }
            AllAppointments.shared.allAppointments.removeAll()
            jsonData?.forEach() { (value) in
                DispatchQueue.main.async {
                    AllAppointments.shared.allAppointments.append(value)
                }
            }
        }
    }
}

//
//  CancelAppointment.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API call to cancel an appointment.
class CancelAppointment {
    static let shared = CancelAppointment()
    init() {
    }
    func cancelAppointment(appointmentId : String, index : Int){
        if let url = URL(string: "\(MyAppointmentAPI.shared.cancelApointment)\(appointmentId)"){
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
                        AllAppointments.shared.allAppointments.remove(at: index)
                        DispatchQueue.main.async {
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAppointmentViewControllerFromDeleteView"), object: nil)
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAppointmentViewTable"), object: nil)
                        }
                    } else {
                        print("\(response.statusCode)")
                    }
                }
                
                do{
                    _ = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

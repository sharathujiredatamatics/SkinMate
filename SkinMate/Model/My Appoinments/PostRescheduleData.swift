//
//  PostRescheduleData.swift
//  SkinMate
//
//  Created by techjini on 20/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation
// API Call to Reschedule an appointment.
class PostRescheduleBookingAppoint{
    static let shared = PostRescheduleBookingAppoint()
    var arr = String()
    init() {
    }
    func bookingAppointmentReschedulePost(){
        
        // Prepare URL
        let parameters: [String: Any] = [
            "date": ComformAppointmentDetails.shared.date,
            "time": [ComformAppointmentDetails.shared.time],
            
            ]
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        let id = ComformAppointmentDetails.shared.appointmentId
        // Prepare URL
        let url = URL(string: "https://skinmate.herokuapp.com/appointments/\(id)")
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let deviceId: String? = KeychainWrapper.standard.string(forKey: "deviceId")
        let tokenId: String? = KeychainWrapper.standard.string(forKey: "tokenId")
        request.setValue(deviceId, forHTTPHeaderField: "device-id")
        request.setValue(tokenId, forHTTPHeaderField: "access-token")
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        // Set HTTP Request Body
        request.httpBody = jsonData
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            if let response = response as? HTTPURLResponse{
                if response.statusCode == 200 {
                    print("\(response.statusCode)")
                } else {
                    print("\(response.statusCode)")
                }
            }
            // Convert HTTP Response Data to a String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
}


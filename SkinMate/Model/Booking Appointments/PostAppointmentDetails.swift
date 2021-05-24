//
//  PostAppointmentDetails.swift
//  SkinMate
//
//  Created by techjini on 19/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//
import Foundation

class PostBookingAppoint{
    static let shared = PostBookingAppoint()
    
    var arr = String()
    init() {
    }
    func bookingAppointmentPost(){
        
        // Prepare URL
        
        let parameters: [String: Any] = [
            "doctorid": ComformAppointmentDetails.shared.doctorid,
            "date": ComformAppointmentDetails.shared.date,
            "time": [ComformAppointmentDetails.shared.time],
            "paymentType": ComformAppointmentDetails.shared.payingType,
            "insuranceInfo": ComformAppointmentDetails.shared.insuranceInfo,
            "appointmentFor": ComformAppointmentDetails.shared.appointmentfor,
            ]
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        
        // Prepare URL
        let url = URL(string: BookingAppointmentApi.shared.postAppointmentApi)
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        let deviceId: String? = KeychainWrapper.standard.string(forKey: "deviceId")
        let tokenId: String? = KeychainWrapper.standard.string(forKey: "tokenId")
        request.setValue(deviceId, forHTTPHeaderField: "device-id")
        request.setValue(tokenId, forHTTPHeaderField: "access-token")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
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
                if response.statusCode == 201 {
                    print("\(response.statusCode)") // sucess code
                } else {
                    print("\(response.statusCode)")
                }
            }
            // Convert HTTP Response Data to a String
         //   if let data = data, let dataString = String(data: data, encoding: .utf8) {
         //       print("Response data string:\n \(dataString)")
         //   }
        }
        task.resume()
    }
}


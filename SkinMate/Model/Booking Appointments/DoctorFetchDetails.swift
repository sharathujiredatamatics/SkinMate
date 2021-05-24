//
//  DoctorFetchDetails.swift
//  SkinMate
//
//  Created by techjini on 18/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
class DoctorFectchDetails {
    static let shared = DoctorFectchDetails()
    init() {
    }
    
    func fectchdoctordetails(){
        let deviceId: String? = KeychainWrapper.standard.string(forKey: "deviceId")
        let tokenId: String? = KeychainWrapper.standard.string(forKey: "tokenId")
        //url for fetching the doctor
        if let url = URL(string: BookingAppointmentApi.shared.fetchDoctorapi){
            var request = URLRequest(url: url)
            
            // request for get request
            request.setValue(deviceId, forHTTPHeaderField: "device-id")
            request.setValue(tokenId, forHTTPHeaderField: "access-token")
            
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                // response from server
                if let response = response as? HTTPURLResponse{
                    if response.statusCode == 200 {
                        print("\(response.statusCode)") // sucess code
                    } else {
                        print("\(response.statusCode)")
                    }
                }
                
                do{
                    let arrdata = try JSONDecoder().decode([DoctorElement].self, from: data)
                 //   print(arrdata[0].name)
                    for i in 0 ..< arrdata.count {
                        // appending data to arrays
                        DoctorDetails.shared.id.append(arrdata[i].id)
                        DoctorDetails.shared.name.append(arrdata[i].name)
                        DoctorDetails.shared.qualification.append(arrdata[i].qualification)
                        
                    }
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}


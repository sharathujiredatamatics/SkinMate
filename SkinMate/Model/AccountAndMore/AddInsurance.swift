//
//  AddInsurance.swift
//  SkinMate
//
//  Created by Datamatics on 19/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API Call to add insurance.
class AddInsurance {
    static let shared = AddInsurance()
    init() {
    }
    func addInsurance(insurance : String){
        var parameters = String()
        parameters = "insurance=\(insurance)"
        if let url = URL(string: AccountAPI.shared.addInsurance){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
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
                    if response.statusCode == 201 {
                        print("\(response.statusCode)")
                        DispatchQueue.main.async {
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadSuceesAddInsuranceViewController"), object: nil)
                            
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

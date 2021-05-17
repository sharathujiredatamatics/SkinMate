
//
//  FetchApointments.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//
import UIKit
class FetchAppointment {
    static let shared = FetchAppointment()
    init() {
    }
    
    func fetchAppointments(){
        let deviceId: String? = KeychainWrapper.standard.string(forKey: "deviceId")
        let tokenId: String? = KeychainWrapper.standard.string(forKey: "tokenId")
        if let url = URL(string: MyAccountAPI.shared.fetchAllApointments){
            var request = URLRequest(url: url)
            
            request.setValue(deviceId, forHTTPHeaderField: "device-id")
            request.setValue(tokenId, forHTTPHeaderField: "access-token")
            
            
            request.httpMethod = "PATCH"
            let parameters: [String : Any] = [:
            ]
            
            request.httpBody = parameters.percentEscaped().data(using: .utf8)
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
                    } else {
                        print("\(response.statusCode)")
                    }
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    print(json!)
              
                    DispatchQueue.main.async {
//                        let storyBoard: UIStoryboard = UIStoryboard(name: "Account", bundle: nil)
//                        let successfullyUpdatedViewController = storyBoard.instantiateViewController(withIdentifier: "SuccessfullyUpdatedViewController") as! SuccessfullyUpdatedViewController
//                        successfullyUpdatedViewController.viewId = "userupdate"
//                        viewController.present(successfullyUpdatedViewController, animated: true)
                    }
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

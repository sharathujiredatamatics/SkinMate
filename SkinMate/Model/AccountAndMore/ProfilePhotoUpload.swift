//
//  ProfilePhotoUpload.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//
import UIKit
class ProfilePhotoUpload {
    static let shared = ProfilePhotoUpload()
    init() {
}
    func uploadPhoto(image : UIImage){
        let deviceId: String? = KeychainWrapper.standard.string(forKey: "deviceId")
        let tokenId: String? = KeychainWrapper.standard.string(forKey: "tokenId")
        if let url = URL(string: AccountAPI.shared.profilePicUpload){
            var request = URLRequest(url: url)
            
            request.setValue(deviceId, forHTTPHeaderField: "device-id")
            request.setValue(tokenId, forHTTPHeaderField: "access-token")
            
            
            request.httpMethod = "POST"
            let parameters: [String : Any] = [
                "firstName": image
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
                      
                    }
                    
                    
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

//
//  ProfilePhotoUpload.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//
import UIKit
// API Call to upload user profile picture.
class ProfilePhotoUpload {
    static let shared = ProfilePhotoUpload()
    init() {
    }
    func uploadPhoto(image : UIImage){
        let imageData = image.jpegData(compressionQuality: 4)
        
        if let url = URL(string: AccountAPI.shared.profilePicUpload){
            var request = URLRequest(url: url)
            
            request.setValue(SystemVerification.shared.deviceId, forHTTPHeaderField: "device-id")
            request.setValue(SystemVerification.shared.tokenId, forHTTPHeaderField: "access-token")
            
            request.httpMethod = "POST"
            
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            let body = String(decoding: imageData!, as: UTF8.self)
            let postData = body.data(using: .utf8)
            request.httpBody = postData
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    //                    guard (400 ... 500) ~= response.statusCode else {
                    let statusCode = response.statusCode
                    print("Status code :- \(statusCode)")
                    
                    
                    if statusCode == 200{
                        print(statusCode)
                        
                    }
                    else if statusCode == 404{
                        
                    }
                    else if statusCode == 500{
                        
                    }
                    else if statusCode == 401{
                        
                    }
                    else if statusCode == 500{
                        
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

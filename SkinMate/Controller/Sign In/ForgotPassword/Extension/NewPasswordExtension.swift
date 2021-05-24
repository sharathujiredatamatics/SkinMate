//
//  NewPasswordExtension.swift
//  SkinMate
//
//  Created by Datamatics on 20/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// API Call for setting new password.
extension NewPasswordViewController{
    func passwordChange(password : String){
        var parameters = String()
        parameters = "password=\(password)"
        
        //        let deviceId: String? = KeychainWrapper.standard.string(forKey: "deviceId")
        //        let tokenId: String? = KeychainWrapper.standard.string(forKey: "tokenId")
        if let url = URL(string: AccountAPI.shared.userUpdate){
            var request = URLRequest(url: url)
            request.httpMethod = "PATCH"
            request.setValue(SystemVerification.shared.deviceId, forHTTPHeaderField: "device-id")
            request.setValue(SystemVerification.shared.tokenId, forHTTPHeaderField: "access-token")
            
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = parameters.data(using: String.Encoding.utf8)
            //request.httpBody = parameters.data(using: .utf8)
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
                        DispatchQueue.main.async {
                            let successForgotPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "SuccessForgotPasswordViewController") as! SuccessForgotPasswordViewController
                            successForgotPasswordViewController.viewId = "successpassword"
                            successForgotPasswordViewController.lblMessage.text = "Password changed successfully\nPlease Login with new password"
                            self.present(successForgotPasswordViewController, animated: true)
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

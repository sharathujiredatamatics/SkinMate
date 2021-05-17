//
//  SignOutExtension.swift
//  SkinMate
//
//  Created by Datamatics on 10/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
extension AccountViewController{
    func logoutUser(){
        if let url = URL(string: AccountAPI.shared.logoutAPI){
            let deviceId: String? = KeychainWrapper.standard.string(forKey: "deviceId")
            let tokenId: String? = KeychainWrapper.standard.string(forKey: "tokenId")
            var request = URLRequest(url: url)
            request.httpMethod = "PURGE"
            request.setValue(tokenId, forHTTPHeaderField: "access-token")
            request.setValue(deviceId, forHTTPHeaderField: "device-id")
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            //request.httpBody = parameters.data(using: String.Encoding.utf8)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    let statusCode = response.statusCode
                    print("Status code :- \(statusCode)")
                    
                    if statusCode == 200{
                        DispatchQueue.main.async {
                            UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
                            UserDefaults.standard.synchronize()
                            let storyBoard:UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
                            
                            let signInViewController = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                            
                            self.present(signInViewController, animated: true)
                        }
                 
                    }
                    else if statusCode == 403{
                        
                         DispatchQueue.main.async {
                        print("Requires Device Id or AccessToken")
                    }
                         }
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    print("Success")
                    print(json!)
                    DispatchQueue.main.async {
                        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
                        UserDefaults.standard.synchronize()
                    let storyBoard:UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
                    
                    let signInViewController = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                    
                    self.present(signInViewController, animated: true)
                    }
                }catch let error{
                    print(error.localizedDescription)
                }
                }.resume()
        }
    }
}

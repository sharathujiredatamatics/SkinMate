//
//  APICall.swift
//  SkinMate
//
//  Created by techjini on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation
import UIKit



class  APICall{
    
    static let shared = APICall()
    
    
    init() {
    }
    var appointment = [Appointments]()
    
    
    func getData()  -> [Appointments]{

        let path = Bundle.main.path(forResource: "Appointments", ofType: "json")
        let url = URL(fileURLWithPath: path!)
      
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _,  error in
            guard let data = data, error == nil else {
                return
            }
            var result: [Appointments]?
            do
            {
                result = try JSONDecoder().decode([Appointments].self, from: data)
            }
            catch{
                print("failed to fetch data")
            }
            guard let final = result else {
                return
            }
            self.appointment = final
       print(self.appointment)
            
        })
        
        task.resume()
        return self.appointment
}
      


}



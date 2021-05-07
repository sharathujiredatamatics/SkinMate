//
//  AlertFunction.swift
//  SkinMate
//
//  Created by Datamatics on 06/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
extension UIViewController{
    // Function for creating alert message.
    func alert(tittle:String, message:String) {
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
}
}

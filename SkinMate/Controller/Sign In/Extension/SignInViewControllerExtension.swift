//
//  SignInViewControllerExtension.swift
//  SkinMate
//
//  Created by Datamatics on 06/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
extension SignInViewController{
    func signInValidation(){
        let mainTab = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        self.present(mainTab!, animated: true, completion: nil)
    }
}

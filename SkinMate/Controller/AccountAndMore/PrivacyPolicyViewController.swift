//
//  PrivacyPolicyViewController.swift
//  SkinMate
//
//  Created by Datamatics on 12/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Class showing Privacy Policy view.
class PrivacyPolicyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    // Button function to go to last view.
    @IBAction func backToMain(_ sender: Any) {
        transitionFromLeft()
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "account"
        self.present(mainTabController!, animated: false, completion: nil)
    }
    
    
}

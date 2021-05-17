//
//  PrivacyPolicyViewController.swift
//  SkinMate
//
//  Created by Datamatics on 12/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToMain(_ sender: Any) {
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "account"
        self.present(mainTabController!, animated: true, completion: nil)
    }
    

}

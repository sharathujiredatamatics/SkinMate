//
//  SwitchTabViewController.swift
//  SkinMate
//
//  Created by Datamatics on 28/04/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class SwitchTabViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadHomePage), name: NSNotification.Name(rawValue: "loadHome"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadAccountPage), name: NSNotification.Name(rawValue: "loadAccount"), object: nil)
    }
    @objc func loadHomePage(notification: NSNotification){
        let homeViewController = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        homeViewController!.view.frame = self.view.bounds
        self.view.addSubview(homeViewController!.view)
        self.addChild(homeViewController!)
        homeViewController!.didMove(toParent: self)
    }
    @objc func loadAccountPage(notification: NSNotification){
        let accountViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "AccountViewController") as? AccountViewController
        accountViewController!.view.frame = self.view.bounds
        self.view.addSubview(accountViewController!.view)
        self.addChild(accountViewController!)
        accountViewController!.didMove(toParent: self)
    }
}

//
//  MainTabController.swift
//  SkinMate
//
//  Created by Datamatics on 28/04/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class MainTabController: UIViewController, UITabBarDelegate {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainTabView: UITabBar!
    @IBOutlet weak var homeTab: UITabBarItem!
    @IBOutlet weak var myAppointmentsab: UITabBarItem!
    @IBOutlet weak var notificationTab: UITabBarItem!
    @IBOutlet weak var accountTab: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTabView.layer.masksToBounds = true
        self.mainTabView.isTranslucent = true
        self.mainTabView.barStyle = .blackOpaque
        self.mainTabView.layer.cornerRadius = 27
        self.mainTabView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadHome"), object: nil)
        mainTabView.selectedItem = mainTabView.items![0] as UITabBarItem
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 1) {
           NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadHome"), object: nil)
        } else if(item.tag == 2) {
            
        }
        else if(item.tag == 3) {
            
        }
        else if(item.tag == 4) {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAccount"), object: nil)
        }
    }
}



//self.willMoveToParentViewController(nil)
//self.view.removeFromSuperview()
//self.removeFromParentViewController()

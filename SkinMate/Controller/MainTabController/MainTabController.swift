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
    var viewId = String()
    var appointmentCount = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        APICall.shared.getData()
        self.mainTabView.layer.masksToBounds = true
        self.mainTabView.isTranslucent = true
        self.mainTabView.barStyle = .blackOpaque
        self.mainTabView.layer.cornerRadius = 27
        self.mainTabView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        appointmentCount = APICall.shared.appointment.count
        addView()
        
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 1) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadHome"), object: nil)
        } else if(item.tag == 2) {
            if appointmentCount == 0 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadNoMyAppointment"), object: nil)
            } else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAllMyAppointment"), object: nil)
            }
            
        }
        else if(item.tag == 3) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadNotification"), object: nil)
        }
        else if(item.tag == 4) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAccount"), object: nil)
        }
    }
    func addView(){
        if viewId == "account"{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAccount"), object: nil)
            mainTabView.selectedItem = mainTabView.items![3] as UITabBarItem
        }
        else if viewId == "notification"{
            
        }
        else if viewId == "home"{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadHome"), object: nil)
            mainTabView.selectedItem = mainTabView.items![0] as UITabBarItem
        }
        else if viewId == "bookappointment"{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadHome"), object: nil)
            mainTabView.selectedItem = mainTabView.items![0] as UITabBarItem
        }
        else if viewId == "allappointments"{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAllMyAppointment"), object: nil)
            mainTabView.selectedItem = mainTabView.items![1] as UITabBarItem
        }
        else if viewId == "myappointmnet"{
            if appointmentCount == 0 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadNoMyAppointment"), object: nil)
                mainTabView.selectedItem = mainTabView.items![1] as UITabBarItem
            } else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadAllMyAppointment"), object: nil)
                mainTabView.selectedItem = mainTabView.items![1] as UITabBarItem
            }
            
        }
    }
}




//self.willMoveToParentViewController(nil)
//self.view.removeFromSuperview()
//self.removeFromParentViewController()

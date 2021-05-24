//
//  SwitchTabViewController.swift
//  SkinMate
//
//  Created by Datamatics on 28/04/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Class to manage all switching actions of tab bar.
class SwitchTabViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadHomePage), name: NSNotification.Name(rawValue: "loadHome"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadAccountPage), name: NSNotification.Name(rawValue: "loadAccount"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadNotificationPage), name: NSNotification.Name(rawValue: "loadNotification"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadAllMyAppointmentPage), name: NSNotification.Name(rawValue: "loadAllMyAppointment"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadNoMyAppointmentPage), name: NSNotification.Name(rawValue: "loadNoMyAppointment"), object: nil)
        
        
    }
    // Presenting Home View..
    @objc func loadHomePage(notification: NSNotification){
        let homeViewController = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        homeViewController!.view.frame = self.view.bounds
        self.view.addSubview(homeViewController!.view)
        self.addChild(homeViewController!)
        homeViewController!.didMove(toParent: self)
    }
    // Presenting Notification View.
    @objc func loadNotificationPage(notification: NSNotification){
        let notificationsViewController = UIStoryboard.init(name: "Notification", bundle: Bundle.main).instantiateViewController(withIdentifier: "NotificationsViewController") as? NotificationsViewController
        notificationsViewController!.view.frame = self.view.bounds
        self.view.addSubview(notificationsViewController!.view)
        self.addChild(notificationsViewController!)
        notificationsViewController!.didMove(toParent: self)
    }
    // Presenting Account View.
    @objc func loadAccountPage(notification: NSNotification){
        let accountViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "AccountViewController") as? AccountViewController
        accountViewController!.view.frame = self.view.bounds
        self.view.addSubview(accountViewController!.view)
        self.addChild(accountViewController!)
        accountViewController!.didMove(toParent: self)
    }
    // Presenting No Appointment View.
    @objc func loadNoMyAppointmentPage(notification: NSNotification){
        let noMyAppointmentViewController = UIStoryboard.init(name: "MyAppointment", bundle: Bundle.main).instantiateViewController(withIdentifier: "NoMyAppointmentViewController") as? NoMyAppointmentViewController
        noMyAppointmentViewController!.view.frame = self.view.bounds
        self.view.addSubview(noMyAppointmentViewController!.view)
        self.addChild(noMyAppointmentViewController!)
        noMyAppointmentViewController!.didMove(toParent: self)
    }
    // Presenting All Appointmemts View.
    @objc func loadAllMyAppointmentPage(notification: NSNotification){
        let allApointmentViewController = UIStoryboard.init(name: "MyAppointment", bundle: Bundle.main).instantiateViewController(withIdentifier: "AllApointmentViewController") as? AllApointmentViewController
        allApointmentViewController!.view.frame = self.view.bounds
        self.view.addSubview(allApointmentViewController!.view)
        self.addChild(allApointmentViewController!)
        allApointmentViewController!.didMove(toParent: self)
    }
}

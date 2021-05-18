//
//  NotificationsViewController.swift
//  SkinMate
//
//  Created by Datamatics on 07/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    

    @IBOutlet weak var notifyView: UIView!
    
    @IBOutlet weak var notificationBar: UILabel!
    
    @IBOutlet weak var notificationTableViiew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notificationTableViiew.tableFooterView = UIView(frame: .zero)
        let bottomBorder = CALayer()
        bottomBorder.borderColor = #colorLiteral(red: 0.06666666667, green: 0.1254901961, blue: 0.1529411765, alpha: 0.5068493151)
        bottomBorder.borderWidth = 1
        bottomBorder.frame = CGRect(x: 0, y: notifyView.frame.height, width: notifyView.frame.width, height: 1)
        notifyView.layer.addSublayer(bottomBorder)
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableViiew.dequeueReusableCell(withIdentifier: "Cell") as! NotificationTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101.0
    }

}

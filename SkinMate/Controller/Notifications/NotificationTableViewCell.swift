//
//  NotificationTableViewCell.swift
//  SkinMate
//
//  Created by techjini on 15/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var notificationBackground: UIImageView!
    
    @IBOutlet weak var notificationBell: UIImageView!
    
    @IBOutlet weak var notificatoinMessage: UILabel!
    
    @IBOutlet weak var reminderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

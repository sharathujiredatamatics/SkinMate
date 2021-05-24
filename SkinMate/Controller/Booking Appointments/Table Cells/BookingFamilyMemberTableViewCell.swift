//
//  FamilyMemberTableViewCell.swift
//  BookAppointments
//
//  Created by techjini on 12/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit

class BookingFamilyMemberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var familyMemberName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

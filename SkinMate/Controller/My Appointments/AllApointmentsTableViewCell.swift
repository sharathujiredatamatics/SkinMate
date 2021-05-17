//
//  AllApointmentsTableViewCell.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class AllApointmentsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var appointmentType: UILabel!
    
    @IBOutlet weak var infoDoctor: UILabel!
    
    @IBOutlet weak var dateAppointment: UILabel!
    
    @IBOutlet weak var appointId: UILabel!
    
    
    @IBOutlet weak var appointmentButton: UIButton!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

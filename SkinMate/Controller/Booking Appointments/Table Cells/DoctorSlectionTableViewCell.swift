//
//  DoctorSlectionTableViewCell.swift
//  BookAppointments
//
//  Created by techjini on 28/04/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit

class DoctorSlectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func showIcon(){
        selectButton.isHidden = false
    }
    func  hideIcon(){
        selectButton.isHidden = true
    }
    
}

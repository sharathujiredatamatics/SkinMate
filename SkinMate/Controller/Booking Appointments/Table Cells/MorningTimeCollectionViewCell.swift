//
//  MorningTimeCollectionViewCell.swift
//  BookAppointments
//
//  Created by techjini on 10/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit

class MorningTimeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var morningTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let fadeView = UIView(frame: bounds)
        fadeView.backgroundColor = DesignColor.shared.getUIColor(hex: "#B1BEB7")
        self.selectedBackgroundView = fadeView
    }
}

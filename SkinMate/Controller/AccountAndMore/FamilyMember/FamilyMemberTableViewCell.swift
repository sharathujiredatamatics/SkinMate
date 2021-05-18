//
//  FamilyMemberTableViewCell.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class FamilyMemberTableViewCell: UITableViewCell {
    @IBOutlet weak var familyView: UIView!
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var updateOrDeleteMember: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

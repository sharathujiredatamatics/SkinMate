//
//  DeleteConformationViewController.swift
//  SkinMate
//
//  Created by Datamatics on 11/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class DeleteConformationViewController: UIViewController {
    @IBOutlet weak var ContainerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var noConfoimation: UIButton!
    @IBOutlet weak var yesConfirmation: UIButton!
    @IBOutlet weak var memberName: UILabel!
    var userId = String()
    var userName = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        memberName.text = userName
        ContainerView.layer.cornerRadius = 30
        ContainerView.layer.masksToBounds = true
        ContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        NotificationCenter.default.addObserver(self, selector: #selector(loadFamilyView), name: NSNotification.Name(rawValue: "loadFamilyViewControllerFromDeleteView"), object: nil)
    }
    
    @objc func loadFamilyView(notification: NSNotification){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
        let familyViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "FamilyViewController") as? FamilyViewController
        self.present(familyViewController!, animated: true, completion: nil)
    }
    @IBAction func noConfirmationAction(_ sender: Any) {
        let familyViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "FamilyViewController") as? FamilyViewController
        self.present(familyViewController!, animated: true, completion: nil)
    }
    @IBAction func yseConfirmationAction(_ sender: UIButton) {
        DeleteFamilyMember.shared.deleteFamilyMember(id: userId)
//        let familyViewController = UIStoryboard.init(name: "Account", bundle: Bundle.main).instantiateViewController(withIdentifier: "FamilyViewController") as? FamilyViewController
//        self.present(familyViewController!, animated: true, completion: nil)
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewTable"), object: nil)
    }
}

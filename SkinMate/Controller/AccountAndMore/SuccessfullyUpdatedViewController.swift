//
//  SuccessfullyUpdatedViewController.swift
//  SkinMate
//
//  Created by Datamatics on 12/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class SuccessfullyUpdatedViewController: UIViewController {
    @IBOutlet weak var ContainerView: UIView!
    
    @IBOutlet weak var imgSuccess: UIImageView!
    
    @IBOutlet weak var lblVerified: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var btnOkay: UIButton!
    var viewId = String()
    var message = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesign()
        lblVerified.text = message
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "loadFamilyViewControllerFromDeleteView"), object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /* override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(animated)
     navigationController?.setNavigationBarHidden(false, animated: animated)
     }*/
    //MARK:- Corner Radius for Containerview.
    func applyDesign() {
        ContainerView.layer.cornerRadius = 30
        ContainerView.layer.masksToBounds = true
        ContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
    }

    @IBAction func success(_ sender: UIButton) {
        if viewId == "userupdate"{
        let storyBoard: UIStoryboard = UIStoryboard(name: "Account", bundle: nil)
        let userUpdateViewController = storyBoard.instantiateViewController(withIdentifier: "UserUpdateViewController") as! UserUpdateViewController
        self.present(userUpdateViewController, animated: true)
        }
        else if viewId == "familyupdate"{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Account", bundle: nil)
            let editFamilyMemberViewController = storyBoard.instantiateViewController(withIdentifier: "EditFamilyMemberViewController") as! EditFamilyMemberViewController
            self.present(editFamilyMemberViewController, animated: true)
        }
        else if viewId == "familyadd"{
        
            let storyBoard: UIStoryboard = UIStoryboard(name: "Account", bundle: nil)
            let addFamilyMemberViewController = storyBoard.instantiateViewController(withIdentifier: "FamilyViewController") as! FamilyViewController
            self.present(addFamilyMemberViewController, animated: true)
    }
}
}

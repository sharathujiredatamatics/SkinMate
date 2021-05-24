//
//  AddInsuranceViewController.swift
//  SkinMate
//
//  Created by Datamatics on 12/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Class to manage Add Insurance view.
class AddInsuranceViewController: UIViewController {
    @IBOutlet weak var addInsuranceButton: UIButton!
    @IBOutlet weak var insuranceDetails: UITextField!
    @IBOutlet weak var errorInsurance: UILabel!
    var validInsurance = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadSuceesAddInsuranceViewController), name: NSNotification.Name(rawValue: "loadSuceesAddInsuranceViewController"), object: nil)
    }
    @IBAction func insuranceEditChangedEnd(_ sender: UITextField) {
        checkInsuranceEnd()
    }
    @IBAction func insuranceEditChanged(_ sender: UITextField) {
        checkInsurance()
    }
    // Button function to go to last view.
    @IBAction func backToMain(_ sender: Any) {
        transitionFromLeft()
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "account"
        self.present(mainTabController!, animated: false)
    }
    // Button function to call AddInsurance API Call.
    @IBAction func addInsurance(_ sender: UIButton) {
        AddInsurance.shared.addInsurance(insurance: insuranceDetails.text!)
    }
    // Function to go to success of add insurance added view..
    @objc func loadSuceesAddInsuranceViewController(notification: NSNotification){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Account", bundle: nil)
        let successfullyUpdatedViewController = storyBoard.instantiateViewController(withIdentifier: "SuccessfullyUpdatedViewController") as! SuccessfullyUpdatedViewController
        successfullyUpdatedViewController.viewId = "insuranceadd"
        successfullyUpdatedViewController.message = "Insurance Added Successfully"
        self.present(successfullyUpdatedViewController, animated: true)
        
    }
}

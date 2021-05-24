//
//  InstructionViewController.swift
//  SkinMate
//
//  Created by techjini on 19/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController {
    
    @IBOutlet weak var waitView: UIView!
    
    
    @IBOutlet weak var waitRequest: UILabel!
    @IBOutlet weak var waitImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesign()
        
        // Do any additional setup after loading the view.
    }
    // Hide navigation bar.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    @IBAction func buttonOkay(_ sender: UIButton) {
        transitionFromLeft()
        let CallViewController = UIStoryboard.init(name: "CheckIn", bundle: Bundle.main).instantiateViewController(withIdentifier: "CallViewController") as?  CallViewController
        CallViewController!.modalPresentationStyle = .overCurrentContext
        CallViewController!.modalTransitionStyle = .crossDissolve
        
        self.present(CallViewController!,animated: true)
    }
    func applyDesign() {
        waitView.layer.cornerRadius = 30
        waitView.layer.masksToBounds = true
        waitView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
    }
    
    
    
}

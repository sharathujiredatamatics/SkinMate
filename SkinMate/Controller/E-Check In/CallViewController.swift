//
//  CallViewController.swift
//  SkinMate
//
//  Created by techjini on 19/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

class CallViewController: UIViewController {
    
    @IBOutlet weak var callView: UIView!
    
    
    @IBOutlet weak var callRequest: UILabel!
    @IBOutlet weak var calImage: UIImageView!
    
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
    // applying design to views.
    
    func applyDesign() {
        callView.layer.cornerRadius = 30
        callView.layer.masksToBounds = true
        callView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
    }
    
    
    
    @IBAction func buttonOkay(_ sender: UIButton) {
        transitionFromLeft()
        
        let mainTabController = UIStoryboard.init(name: "MainTabController", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainTabController") as? MainTabController
        mainTabController?.viewId = "home"
        mainTabController!.view.frame = self.view.bounds
        self.view.addSubview(mainTabController!.view)
        self.addChild(mainTabController!)
        mainTabController!.didMove(toParent: self)
        
        
    }
    
}

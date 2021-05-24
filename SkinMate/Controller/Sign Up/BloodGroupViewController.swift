//
//  BloodGroupViewController.swift
//  SkinMate
//
//  Created by techjini on 20/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
protocol dataPass {
    func dataPassing(bGroup: String)
    
}

class BloodGroupViewController: UIViewController {
    
    
    @IBOutlet weak var parentView: UIView!
    
    
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var firstStack: UIStackView!
    
    @IBOutlet weak var lblFirst: UILabel!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondStack: UIStackView!
    @IBOutlet weak var lblSecond: UILabel!
    
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var thirdStack: UIStackView!
    @IBOutlet weak var lblThird: UILabel!
    
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var fourthStack: UIStackView!
    @IBOutlet weak var lblFourth: UILabel!
    
    @IBOutlet weak var FifthView: UIView!
    @IBOutlet weak var fifthStack: UIStackView!
    @IBOutlet weak var lblFifth: UILabel!
    
    @IBOutlet weak var SixthView: UIView!
    @IBOutlet weak var SixthStack: UIStackView!
    @IBOutlet weak var lblSixth: UILabel!
    
    @IBOutlet weak var SevenView: UIView!
    @IBOutlet weak var SevenStack: UIStackView!
    @IBOutlet weak var lblSeven: UILabel!
    
    @IBOutlet weak var EightView: UIView!
    @IBOutlet weak var EightStack: UIStackView!
    @IBOutlet weak var lblEight: UILabel!
    var delegate: dataPass!
    
    var blooodGroup = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesign()
        gestureHandler()
        
        
        // Do any additional setup after loading the view.
    }
    
    func applyDesign() {
        parentView.layer.cornerRadius = 40
        parentView.layer.masksToBounds = true
        parentView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    
    
    
    
}

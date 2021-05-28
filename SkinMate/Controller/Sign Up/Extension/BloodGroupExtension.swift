//
//  BloodGroupExtension.swift
//  SkinMate
//
//  Created by techjini on 20/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import Foundation
import UIKit
extension BloodGroupViewController {
    //  MARK:- Gestures Handler
    func gestureHandler(){
        let First = UITapGestureRecognizer(target: self, action:  #selector(firstSelected(sender:)))
        firstView.isUserInteractionEnabled = true
        firstView.addGestureRecognizer(First)
        
        let second = UITapGestureRecognizer(target: self, action:  #selector(secondSelected(sender:)))
        secondView.isUserInteractionEnabled = true
        secondView.addGestureRecognizer(second)
        
        let third = UITapGestureRecognizer(target: self, action:  #selector( thirdSelected(sender:)))
        thirdView.isUserInteractionEnabled = true
        thirdView.addGestureRecognizer(third)
        
        
        let fourth = UITapGestureRecognizer(target: self, action:  #selector(fourthSelected(sender:)))
        fourthView.isUserInteractionEnabled = true
        fourthView.addGestureRecognizer(fourth)
        
        
        let fifth = UITapGestureRecognizer(target: self, action:  #selector(fifthSelected(sender:)))
        FifthView.isUserInteractionEnabled = true
        FifthView.addGestureRecognizer(fifth)
        
        let sixth = UITapGestureRecognizer(target: self, action:  #selector(sixthSelected(sender:)))
        SixthView.isUserInteractionEnabled = true
        SixthView.addGestureRecognizer(sixth)
        
        let seven = UITapGestureRecognizer(target: self, action:  #selector( seventhSelected(sender:)))
        SevenView.isUserInteractionEnabled = true
        SevenView.addGestureRecognizer(seven)
        
        
        let eight = UITapGestureRecognizer(target: self, action:  #selector(eightSelected(sender:)))
        EightView.isUserInteractionEnabled = true
        EightView.addGestureRecognizer(eight)
        
    }
    
    @objc func firstSelected(sender : UITapGestureRecognizer) {
        
        blooodGroup = lblFirst.text!
        delegate.dataPassing(bGroup: blooodGroup)
        print(blooodGroup)
        self.dismiss(animated: true, completion: nil)
        
    }
    @objc func secondSelected(sender : UITapGestureRecognizer) {
        blooodGroup = lblSecond.text!
        delegate.dataPassing(bGroup: blooodGroup)
        print(blooodGroup)
        self.dismiss(animated: true, completion: nil)
        
    }
    @objc func thirdSelected(sender : UITapGestureRecognizer) {
        blooodGroup = lblThird.text!
        delegate.dataPassing(bGroup: blooodGroup)
        print(blooodGroup)
        self.dismiss(animated: true, completion: nil)
    }
    @objc func fourthSelected(sender : UITapGestureRecognizer) {
        blooodGroup = lblFourth.text!
        delegate.dataPassing(bGroup: blooodGroup)
        print(blooodGroup)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func fifthSelected(sender : UITapGestureRecognizer) {
        blooodGroup = lblFifth.text!
        delegate.dataPassing(bGroup: blooodGroup)
        print(blooodGroup)
        
        self.dismiss(animated: true, completion: nil)
    }
    @objc func sixthSelected(sender : UITapGestureRecognizer) {
        
        blooodGroup = lblSixth.text!
        delegate.dataPassing(bGroup: blooodGroup)
        print(blooodGroup)
        self.dismiss(animated: true, completion: nil)
    }
    @objc func seventhSelected(sender : UITapGestureRecognizer) {
        
        blooodGroup = lblSeven.text!
        delegate.dataPassing(bGroup: blooodGroup)
        print(blooodGroup)
        
        self.dismiss(animated: true, completion: nil)
    }
    @objc func eightSelected(sender : UITapGestureRecognizer) {
        blooodGroup = lblEight.text!
        delegate.dataPassing(bGroup: blooodGroup)
        print(blooodGroup)
        
        self.dismiss(animated: true, completion: nil)
    }
}

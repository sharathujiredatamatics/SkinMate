//
//  TransitionStyle.swift
//  SkinMate
//
//  Created by Datamatics on 19/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
import UIKit
// Class to manage transition style of view controller.
class TransitionStyle{
    static let shared = TransitionStyle()
    init() {
    }
    var transition = CATransition()
}
extension UIViewController{
    // Transtion from left.
    func transitionFromLeft(){
        TransitionStyle.shared.transition.duration = 0.5
        TransitionStyle.shared.transition.type = CATransitionType.push
        TransitionStyle.shared.transition.subtype = CATransitionSubtype.fromLeft
        TransitionStyle.shared.transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(TransitionStyle.shared.transition, forKey: kCATransition)
    }
    // Tansition from right.
    func transitionFromRight(){
        TransitionStyle.shared.transition.duration = 0.5
        TransitionStyle.shared.transition.type = CATransitionType.push
        TransitionStyle.shared.transition.subtype = CATransitionSubtype.fromRight
        TransitionStyle.shared.transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(TransitionStyle.shared.transition, forKey: kCATransition)
    }
}

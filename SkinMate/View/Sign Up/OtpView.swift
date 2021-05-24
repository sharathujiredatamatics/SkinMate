//
//  OtpView.swift
//  DermitologyApplication
//
//  Created by techjini on 23/04/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation
import UIKit

class OtpView: UIViewController {
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    @IBOutlet weak var lblOtp: UILabel!
    
    @IBOutlet weak var imgGroup: UIImageView!
    
    
    @IBOutlet weak var lblEnterOtp: UILabel!
    
    @IBOutlet weak var txtOTP: UITextField!
    
    @IBOutlet weak var lblTimer: UILabel!
    
    var seconds = 120
    var otpTimer = Timer()
    var isRunning = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        txtOTP.defaultTextAttributes.updateValue(5.0, forKey: NSAttributedString.Key.kern)
        runTimer()
        
    }
    
    func runTimer() {
        otpTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc  func updateTimer() {
        seconds -= 1
        lblTimer.text = timeString(time: TimeInterval(seconds))
    }
    
    func timeString(time:TimeInterval) -> String {
        
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02im %02is", minutes,seconds)
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
    
    
    @IBAction func BtnResend(_ sender: UIButton) {
        
    }
    
    
    @IBAction func BtnConfirm(_ sender: UIButton) {
        self.view.isHidden = true
        // self.dismiss(animated: true, completion: nil)
        sender.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let sec =  storyBoard.instantiateViewController(withIdentifier: "OTP") as! OtpSuccessViewController
        self.present(sec,animated: true)
        //  self.navigationController?.pushViewController(sec, animated: true)
        
        
    }
    
    
    
}

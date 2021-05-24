//
//  DesignColor.swift
//  BookAppointments
//
//  Created by techjini on 11/05/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import Foundation
import UIKit

class DesignColor{
    static let shared = DesignColor()
    
    func getUIColor(hex: String, alpha: Double = 1.0) -> UIColor? {
        var cleanString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cleanString.hasPrefix("#"))
        {
            cleanString.remove(at: cleanString.startIndex)
            
        }
        if ((cleanString.count) != 6)
        { return nil }
        var rgbValue: UInt32 = 0
        Scanner(string: cleanString).scanHexInt32(&rgbValue)
        
        return UIColor( red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0) )}
    
}

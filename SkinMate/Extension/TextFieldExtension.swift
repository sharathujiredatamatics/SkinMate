//
//  TextFieldExtension.swift
//  SkinMate
//
//  Created by Datamatics on 16/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//
import UIKit
// Extension for UITextField to design in StoryBoard with border width, corner radius and color.
@IBDesignable extension UITextField {
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

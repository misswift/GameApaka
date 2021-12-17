//
//  Extensions.swift
//  GameApaka
//
//  Created by Халим Магомедов on 07.12.2021.
//

import Foundation
import UIKit


extension UIButton {
    convenience init(cornerRadius: CGFloat, title: String, borderWidth: CGFloat?, borderColor: CGColor? ) {
        self.init(type: .system)
        //задаем надпись на кнопке в нормльном состоянии
        self.setTitle(title, for: .normal)
        //задаем цвет и ширину рамки
        self.layer.borderWidth = borderWidth ?? 0
        self.layer.borderColor = borderColor ?? nil
        //округляем края кнопки
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}

extension UITextView {
    convenience init(borderWidth: CGFloat, borderColor: CGColor, font: CGFloat) {
        self.init()
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.contentInset = UIEdgeInsets(top: 25, left: 10, bottom: 0, right: 0)
        self.font = UIFont.systemFont(ofSize: font)
      //  self.contentInset = contentInset
    }
    
    private func add(_ placeholder: UILabel) {
            for view in self.subviews {
                if let lbl = view as? UILabel  {
                    if lbl.text == placeholder.text {
                        lbl.removeFromSuperview()
                    }
                }
            }
            self.addSubview(placeholder)
        }
        
        func addPlaceholder(_ placeholder: UILabel?) {
            if let ph = placeholder {
                ph.numberOfLines = 1  // support for multiple lines
                ph.font = UIFont.italicSystemFont(ofSize: (self.font?.pointSize)!)
                ph.sizeToFit()
                self.add(ph)
                ph.frame.origin = CGPoint(x: 15, y: -15)
                ph.textColor = UIColor(white: 0, alpha: 0.3)
                updateVisibility(ph)
            }
        }
        
        func updateVisibility(_ placeHolder: UILabel?) {
            if let ph = placeHolder {
                ph.isHidden = !self.text.isEmpty
            }
        }
    
}


extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

//
//  Extension+font.swift
//  GameApaka
//
//  Created by Халим Магомедов on 26.12.2021.
//

import Foundation
import UIKit

extension UIFont {
    static func fontManrope() -> UIFont {
        customFont("Manrope-Light", size: 28)
    }
    static func fontManropeBold() -> UIFont {
        customFont("Manrope-Bold", size: 18)
    }
    
    private static func customFont(
        _ name: String,
        size: CGFloat,
        textStyle: UIFont.TextStyle? = nil,
        scaled: Bool = false) -> UIFont {

        guard let font = UIFont(name: name, size: size) else {
            print("Warning: Font \(name) not found.")
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
        
        if scaled, let textStyle = textStyle {
            let metrics = UIFontMetrics(forTextStyle: textStyle)
            return metrics.scaledFont(for: font)
        } else {
            return font
        }
    }
}

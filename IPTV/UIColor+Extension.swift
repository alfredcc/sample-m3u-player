//
//  UIColor+Extension.swift
//  IPTV
//
//  Created by race on 2022/2/11.
//

import UIKit

extension UIColor {
    /// rgb
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }

    /// rgb with alpha
    static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }

    // #F161B9 / #ac3422 / ef3a2d -> UIColor
    static func hexString(_ hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            return UIColor.gray
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor.rgb(CGFloat((rgbValue & 0xFF0000) >> 16),
                           CGFloat((rgbValue & 0x00FF00) >> 8),
                           CGFloat(rgbValue & 0x0000FF))
    }

    public func colorByAdjustAlpha(_ alpha: CGFloat) -> UIColor {
        let color = CIColor(color: self)
        return UIColor(red: color.red, green: color.green, blue: color.blue, alpha: alpha)
    }

    var hexString: String? {
        if let components = cgColor.components {
            let r = components[0]
            let g = components[1]
            let b = components[2]
            return String(format: "%02X%02X%02X", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
}

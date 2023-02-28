//
//  UIColor+ext.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

extension UIColor {
   
    convenience init(hexString: String) {
        var string = hexString
        if string.hasPrefix("#") {
            string.remove(at: string.startIndex)
        }
        let scanner = Scanner(string: string)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff
        
        self.init(
            red: CGFloat(red) / 0xff,
            green: CGFloat(green) / 0xff,
            blue: CGFloat(blue) / 0xff, alpha: 1
        )
    }

}

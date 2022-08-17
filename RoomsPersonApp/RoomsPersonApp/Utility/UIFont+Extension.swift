//
//  UIFont+Extension.swift
//  RoomsPersonApp
//
//  Created by Daniel on 15/08/22.
//

import Foundation
import UIKit

let customFonts: [UIFont.TextStyle: UIFont] = [
    .largeTitle: UIFont(name: "Merriweather-Regular", size: 16)!,
    .title1: UIFont(name: "Merriweather-Regular", size: 15)!,
    .title2: UIFont(name: "Merriweather-Regular", size: 14)!,
    .title3: UIFont(name: "Merriweather-Regular", size: 13)!,
    .body: UIFont(name: "Merriweather-Regular", size: 11)!,
    .callout: UIFont(name: "Merriweather-Regular", size: 10)!,
    .subheadline: UIFont(name: "Merriweather-Regular", size: 9)!,
    .footnote: UIFont(name: "Merriweather-Regular", size: 8)!,
    .caption1: UIFont(name: "Merriweather-Regular", size: 7)!,
    .caption2: UIFont(name: "Merriweather-Regular", size: 5)!
]

extension UIFont {
    class func customFont(forTextStyle style: UIFont.TextStyle) -> UIFont {
        let customFont = customFonts[style]!
        let metrics = UIFontMetrics(forTextStyle: style)
        let scaledFont = metrics.scaledFont(for: customFont)
        return scaledFont
    }
}

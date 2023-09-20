//
//  UIFontDescriptor+Dynamic.swift
//  
//
//  Created by Allen on 9/19/23.
//

import Foundation
import UIKit

public extension UIFontDescriptor {
    final class func preferredDescriptor(textStyle: UIFont.TextStyle) -> UIFontDescriptor {
        // sizes from XS to XXXL and LargeText-M to LargeText-XXXL
        let contentSize = UIApplication.shared.preferredContentSizeCategory
        // get predefined custom textStle size table
        let style = iOSFontSizeTable[textStyle]!

        // get size from table
        return UIFontDescriptor(name: PreferredFont.name, size: style[contentSize]!)
    }

    // custom range when necessary
    // define normal range with min to max
    // define LargeText range with amin to amax
    class func customFontDescriptor(fontName: String?, min: CGFloat, max: CGFloat, amin accessibilityMin: CGFloat, amax accessibilityMax: CGFloat) -> UIFontDescriptor {
        let contentSize = UIApplication.shared.preferredContentSizeCategory
        var customFontTable: [UIContentSizeCategory: CGFloat] = [:]
        let unit = (max - min)/6
        let aUnit = (accessibilityMax - accessibilityMin)/4
        customFontTable[.accessibilityExtraExtraExtraLarge] = accessibilityMax
        customFontTable[.accessibilityExtraExtraLarge] = accessibilityMin + 3*aUnit
        customFontTable[.accessibilityExtraLarge] = accessibilityMin + 2*aUnit
        customFontTable[.accessibilityLarge] = accessibilityMin + aUnit
        customFontTable[.accessibilityMedium] = accessibilityMin
        customFontTable[.extraExtraExtraLarge] = max
        customFontTable[.extraExtraLarge] = min + 5*unit
        customFontTable[.extraLarge] = min + 4*unit
        customFontTable[.large] = min + 3*unit
        customFontTable[.medium] = min + 2*unit
        customFontTable[.small] = min + unit
        customFontTable[.extraSmall] = min
        return UIFontDescriptor(name: fontName ?? PreferredFont.name, size: customFontTable[contentSize] ?? 16)
    }
}

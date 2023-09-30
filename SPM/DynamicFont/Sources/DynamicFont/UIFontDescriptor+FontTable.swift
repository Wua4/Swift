//
//  UIFontDescriptor+FontTable.swift
//  
//
//  Created by Allen on 9/19/23.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

public extension UIFontDescriptor {
    struct PreferredFont {
        static var name: String = "SF UI Text"
    }

    
    // https://developer.apple.com/design/human-interface-guidelines/typography
    // Convert normal+large to use normal size.
    // 5 LargeText sizes
        // 1 apart
    // 7 normal sizes
        // 0.5 apart
    static let iOSFontSizeTable: [UIFont.TextStyle: [UIContentSizeCategory: CGFloat]] = [
        .largeTitle: [
            .accessibilityExtraExtraExtraLarge: 48,
            .accessibilityExtraExtraLarge: 47,
            .accessibilityExtraLarge: 46,
            .accessibilityLarge: 45,
            .accessibilityMedium: 44,
            .extraExtraExtraLarge: 41,
            .extraExtraLarge: 40.5,
            .extraLarge: 40,
            .large: 39.5,
            .medium: 39,
            .small: 38.5,
            .extraSmall: 38
        ],
        .title1: [
            .accessibilityExtraExtraExtraLarge: 41,
            .accessibilityExtraExtraLarge: 40,
            .accessibilityExtraLarge: 39,
            .accessibilityLarge: 38,
            .accessibilityMedium: 37,
            .extraExtraExtraLarge: 34,
            .extraExtraLarge: 33.5,
            .extraLarge: 33,
            .large: 32.5,
            .medium: 32,
            .small: 31.5,
            .extraSmall: 31
        ],
        .title2: [
            .accessibilityExtraExtraExtraLarge: 34,
            .accessibilityExtraExtraLarge: 33,
            .accessibilityExtraLarge: 32,
            .accessibilityLarge: 31,
            .accessibilityMedium: 30,
            .extraExtraExtraLarge: 27,
            .extraExtraLarge: 26.5,
            .extraLarge: 26,
            .large: 25.5,
            .medium: 25,
            .small: 24.5,
            .extraSmall: 24
        ],
        .title3: [
            .accessibilityExtraExtraExtraLarge: 32,
            .accessibilityExtraExtraLarge: 31,
            .accessibilityExtraLarge: 30,
            .accessibilityLarge: 29,
            .accessibilityMedium: 28,
            .extraExtraExtraLarge: 25,
            .extraExtraLarge: 24.5,
            .extraLarge: 24,
            .large: 23.5,
            .medium: 23,
            .small: 22.5,
            .extraSmall: 22
        ],
        .headline: [
            .accessibilityExtraExtraExtraLarge: 29,
            .accessibilityExtraExtraLarge: 28,
            .accessibilityExtraLarge: 27,
            .accessibilityLarge: 26,
            .accessibilityMedium: 25,
            .extraExtraExtraLarge: 22,
            .extraExtraLarge: 21.5,
            .extraLarge: 21,
            .large: 20.5,
            .medium: 20,
            .small: 19.5,
            .extraSmall: 19
        ],
        .body: [
            .accessibilityExtraExtraExtraLarge: 29,
            .accessibilityExtraExtraLarge: 28,
            .accessibilityExtraLarge: 27,
            .accessibilityLarge: 26,
            .accessibilityMedium: 25,
            .extraExtraExtraLarge: 22,
            .extraExtraLarge: 21.5,
            .extraLarge: 21,
            .large: 20.5,
            .medium: 20,
            .small: 19.5,
            .extraSmall: 19
        ],
        .callout: [
            .accessibilityExtraExtraExtraLarge: 28,
            .accessibilityExtraExtraLarge: 27,
            .accessibilityExtraLarge: 26,
            .accessibilityLarge: 25,
            .accessibilityMedium: 24,
            .extraExtraExtraLarge: 21,
            .extraExtraLarge: 20.5,
            .extraLarge: 20,
            .large: 19.5,
            .medium: 19,
            .small: 18.5,
            .extraSmall: 18
        ],
        .subheadline: [
            .accessibilityExtraExtraExtraLarge: 28,
            .accessibilityExtraExtraLarge: 27,
            .accessibilityExtraLarge: 26,
            .accessibilityLarge: 25,
            .accessibilityMedium: 24,
            .extraExtraExtraLarge: 19,
            .extraExtraLarge: 18.5,
            .extraLarge: 18,
            .large: 17.5,
            .medium: 17,
            .small: 16.5,
            .extraSmall: 16
        ],
        .footnote: [
            .accessibilityExtraExtraExtraLarge: 24,
            .accessibilityExtraExtraLarge: 23,
            .accessibilityExtraLarge: 22,
            .accessibilityLarge: 21,
            .accessibilityMedium: 20,
            .extraExtraExtraLarge: 19,
            .extraExtraLarge: 18.5,
            .extraLarge: 18,
            .large: 17.5,
            .medium: 17,
            .small: 16.5,
            .extraSmall: 16
        ],
        .caption1: [
            .accessibilityExtraExtraExtraLarge: 23,
            .accessibilityExtraExtraLarge: 22,
            .accessibilityExtraLarge: 21,
            .accessibilityLarge: 20,
            .accessibilityMedium: 21,
            .extraExtraExtraLarge: 16,
            .extraExtraLarge: 15.5,
            .extraLarge: 15,
            .large: 14.5,
            .medium: 14,
            .small: 13.5,
            .extraSmall: 13
        ],
        .caption2: [
            .accessibilityExtraExtraExtraLarge: 22,
            .accessibilityExtraExtraLarge: 21,
            .accessibilityExtraLarge: 20,
            .accessibilityLarge: 19,
            .accessibilityMedium: 18,
            .extraExtraExtraLarge: 15.5,
            .extraExtraLarge: 15,
            .extraLarge: 14.5,
            .large: 14,
            .medium: 13.6,
            .small: 13.3,
            .extraSmall: 13
        ]
    ]
}

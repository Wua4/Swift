/*
- [ ] Problem 2: Reasonable Dynamically Sized Font Library
    - [ ] Normal iOS HIG are too large in Large Text accesibility size
        - [ ] Convert normal+large to use normal size.
    - [ ] Ease of use prioritized
        - [ ] Simple naming
        - [ ] Init functions handle Observers
        - [ ] Handle storyboard button issue (Type:System/Style:Default)
    - [ ] See if override UILabel allowed (Care for buttons/attributed text) - NO, TOO DANGEROUS
        - [ ] Storyboard
        - [ ] ViewController (titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
    - [ ] iPadOS will use normal HIG standards.
*/

// USAGE
//class SomeViewController: UIViewController {
//    @IBOutlet var someLabel: UILabel!
//    @IBOutlet var someButton: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupContentSizeObserver()
//    }
//
//    override func setupDynamicFontStyles() {
//        someLabel.setDynamicFont(forTextStyle: .title1)
//        someButton.setDynamicFont(forTextStyle: .body)
//    }
//}

import Foundation
#if canImport(UIKit)
import UIKit
#endif
// or can use
#if os(iOS)
// Code specific to iOS
#else
// Other
#endif


public class DynamicFont {
    public static func preferredFont(forTextStyle textStyle: UIFont.TextStyle) -> UIFont {
        let descriptor = UIFontDescriptor.preferredDescriptor(textStyle: textStyle)
        return UIFont(descriptor: descriptor, size: 0)
    }

    public static func customFont(name: String,
                                  min: CGFloat,
                                  max: CGFloat,
                                  amin accessibilityMin: CGFloat,
                                  amax accessibilityMax: CGFloat) -> UIFont {
        let descriptor = UIFontDescriptor.customFontDescriptor(fontName: name,
                                                               min: min,
                                                               max: max,
                                                               amin: accessibilityMin,
                                                               amax: accessibilityMax)
        return UIFont(descriptor: descriptor, size: 0)
    }
}

public extension UILabel {
    func setDynamicFont(forTextStyle textStyle: UIFont.TextStyle) {
        print("Font Changed")
        self.font = DynamicFont.preferredFont(forTextStyle: textStyle)
    }
}

public extension UIButton {
    func setDynamicFont(forTextStyle textStyle: UIFont.TextStyle) {
        self.titleLabel?.font = DynamicFont.preferredFont(forTextStyle: textStyle)
    }
}

extension UIViewController {
    public func setupContentSizeObserver() {
        print("Set Observer")
        NotificationCenter.default.removeObserver(self, name: UIContentSizeCategory.didChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(preferredContentSizeChanged(_:)),
                                               name: UIContentSizeCategory.didChangeNotification, object: nil)
    }

    @objc func preferredContentSizeChanged(_ notification: Notification) {
        print("Size Changed")
        setupDynamicFontStyles()
    }

    /// Function should be overrided
    ///
    /// ```
    /// SAMPLE CODE
    ///
    /// someLabel.font = DynamicFont.preferredFont(forTextStyle: .title1)
    /// someButton.titleLabel?.font = DynamicFont.preferredFont(forTextStyle: .body)
    /// someButton.titleLabel?.font = DynamicFont.customFont(name: "SF UI Text", min: 38, max: 41, amin: 44, amax: 48)
    ///
    /// someLabel.setDynamicFont(forTextStyle: .title1)
    /// someButton.setDynamicFont(forTextStyle: .body)
    /// ```
    @objc open func setupDynamicFontStyles() {
       print("Must override")
    }
}

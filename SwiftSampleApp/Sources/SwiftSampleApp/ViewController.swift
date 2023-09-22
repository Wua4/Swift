//
//  ViewController.swift
//  SwiftSampleApp
//
//  Created by Allen on 9/20/23.
//

#if canImport(UIKit)
import UIKit
#endif
import DynamicFont

/*
 https://dragosneagu.com/how-to-create-a-swift-package-from-an-existing-cocoapods-project/

 terminal: swift package init

 Add to Package.swift:
 defaultLocalization: "en",
 platforms: [.iOS(.v13)],

 By default, targets use "Sources" and "Tests",
 optionally can set with path: "folderName"

 move Modules and Tests to folders.
 
 fix podspecs if necessary

 add dependencies
 https://www.swiftbysundell.com/articles/managing-dependencies-using-the-swift-package-manager/
 */

class ViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View loaded")

        setupUI()
        // Do any additional setup after loading the view.
        setupContentSizeObserver()
    }

    func setupUI() {
        titleLabel.text = "This line should dynamically size, but reasonably."
        titleLabel.font = DynamicFont.preferredFont(forTextStyle: .largeTitle)
    }

    override func setupDynamicFontStyles() {
        titleLabel.setDynamicFont(forTextStyle: .largeTitle)
        print(titleLabel.font.pointSize)
    }
}



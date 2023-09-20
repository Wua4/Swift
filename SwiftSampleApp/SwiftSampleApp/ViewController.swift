//
//  ViewController.swift
//  SwiftSampleApp
//
//  Created by Allen on 9/20/23.
//

import UIKit
import DynamicFont


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



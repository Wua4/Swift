//
//  ViewController.swift
//  SwiftSampleApp
//
//  Created by Allen on 9/20/23.
//

/*
 - [x] DEVELOP SAMPLE PACKAGES
     - [x] Need to use via local and remote dependency.
         - [x] Local - Add package to project?
             - [x]  DynamicFont
         - [x] Remote -  Dependencies file
             - [x] Realm
             - [x] FlexStackView
 */


import UIKit
import DynamicFont
import FlexStackView
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var buttonStack: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "This line should dynamically size, but reasonably."
        setupUI()
        setupContentSizeObserver()
    }

    func setupUI() {
        titleLabel.font = DynamicFont.preferredFont(forTextStyle: .body)

        let swiftUIButton = SimpleButton("Navigate to SwiftUI")
        swiftUIButton.addTarget(self, action: #selector(openSwiftUIView), for: .touchUpInside)

        let flexStackUIKitButton = SimpleButton("Test FlexStack (UIKit)")
        flexStackUIKitButton.setDynamicFont(forTextStyle: .headline)
        flexStackUIKitButton.addTarget(self, action: #selector(openFSUIKitView), for: .touchUpInside)

        let flexStackSwiftUIButton = SimpleButton("Test FlexStack (SwiftUI)")
        flexStackSwiftUIButton.setDynamicFont(forTextStyle: .footnote)
        flexStackSwiftUIButton.addTarget(self, action: #selector(openFSSwiftUIView), for: .touchUpInside)

        buttonStack.addArrangedSubview(swiftUIButton)
        buttonStack.addArrangedSubview(flexStackUIKitButton)
        buttonStack.addArrangedSubview(flexStackSwiftUIButton)
    }

    override func preferredContentSizeChanged(_ notification: Notification) {
        setupUI()
    }
}

extension ViewController {
    func SimpleButton(_ title: String = "") -> UIButton {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 21

        NSLayoutConstraint.activate([button.heightAnchor.constraint(equalToConstant: 42)])

        button.setDynamicFont(forTextStyle: .body)
        button.setTitle(title, for: .normal)
        return button
    }

    @objc func openSwiftUIView() {
        // Hosting allows briding UIKit and SwiftUI
        // Easy to remove later
        print("Navigate to SwiftUI")
        guard let navController = self.navigationController else { return }
        var swiftUIView = SwiftUIView()
        swiftUIView.navigationController = navController
        let swiftUIViewController = UIHostingController(rootView: swiftUIView)
        self.navigationController?.pushViewController(swiftUIViewController, animated: true)
    }

    @objc func openFSUIKitView() {
        print("Test FlexStack (UIKit)")
        let flexStackTestView = FlexStackViewController()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(flexStackTestView, animated: true)
    }

    @objc func openFSSwiftUIView() {
        print("Test FlexStack (SwiftUI)")
        guard let navController = self.navigationController else { return }
        var swiftUIView = SwiftUIView_FlexStack()
        swiftUIView.navigationController = navController
        let swiftUIViewController = UIHostingController(rootView: swiftUIView)
        self.navigationController?.pushViewController(swiftUIViewController, animated: true)
    }
}

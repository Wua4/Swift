//
//  FlexStackViewController.swift
//  SwiftSampleApp
//
//  Created by Allen on 9/27/23.
//

import UIKit
import FlexStackView
import DynamicFont


class FlexStackViewController: UIViewController {
    var containerView: UIView!
    var stackView: FlexStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentSizeObserver()
        setupFlexStack()
    }

    override func preferredContentSizeChanged(_ notification: Notification) {
        rebuildFlexStack()
    }

    func setupFlexStack() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        containerView = UIView()

        containerView.translatesAutoresizingMaskIntoConstraints = false

        containerView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        self.view.addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.widthAnchor.constraint(equalToConstant: width),
            containerView.heightAnchor.constraint(equalToConstant: height)
        ])

        stackView = FlexStackView()
        containerView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 100),
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 42)
        ])

        rebuildFlexStack()
    }

    func rebuildFlexStack() {
        stackView.clearAllViews()
        stackView.axis = .vertical

        let colors:[UIColor] = [.yellow, .orange, .red, .systemMint]
        let images = ["figure.walk","info.circle","calendar","house"]
        let font = DynamicFont.preferredFont(forTextStyle: .body)

        for i in 0...3 {
            let label = "Longer Label --- \(i)"
            let view = generateContentStack(title: label, imageName: images[i], color: colors[i] )
            stackView.addView(view, adjustsForText: label, font: font)
        }

//        stackView.defaultPerRow = 2
        stackView.presetItemsinRow[0] = 4
        stackView.adjustStacks()
    }

    
}
extension FlexStackViewController {
    func generateContentStack(title: String,
                              imageName: String,
                              data: NSAttributedString? = NSAttributedString(string: "TEST"),
                              color: UIColor? = .white) -> UIStackView {
        let contentStack = UIStackView()
        contentStack.axis = .vertical
        contentStack.distribution = .fill
        contentStack.alignment = .fill
        contentStack.spacing = 8
        contentStack.backgroundColor = color

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = .blue
        titleLabel.font = DynamicFont.preferredFont(forTextStyle: .body)
        titleLabel.sizeToFit()

        let dataStack = UIStackView()
        dataStack.axis = .horizontal
        dataStack.spacing = 8
        dataStack.distribution = .fill
        dataStack.alignment = .bottom

        let dataLabel = UILabel()
        dataLabel.textAlignment = .left
        dataLabel.attributedText = data
        dataLabel.numberOfLines = 0
        dataLabel.lineBreakMode = .byWordWrapping

        if imageName != "", let image = UIImage(systemName: imageName) {
            let imageView = UIImageView()
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.image = image

            let imageHolderView = UIView()
            imageHolderView.addSubview(imageView)

            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageHolderView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                imageView.centerYAnchor.constraint(equalTo: imageHolderView.centerYAnchor),
                imageView.leadingAnchor.constraint(equalTo: imageHolderView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: imageHolderView.trailingAnchor),
                imageHolderView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30)
            ])

            dataStack.addArrangedSubview(imageHolderView)
        }

        dataStack.addArrangedSubview(dataLabel)

        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(dataStack)
        return contentStack
    }
}

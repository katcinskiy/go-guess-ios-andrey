//
//  ConstrainedButton.swift
//  Igrulya
//
//  Created by Andrey on 02.11.2023.
//

import UIKit

extension UIColor {
    static var lightGreen: UIColor {
        UIColor(red: 156 / 255, green: 200 / 255, blue: 101 / 255, alpha: 1.0)
    }
}

class ConstrainedButton: UIButton {
    // MARK: - properties

    // MARK: - Initialization

    // This method is called when the button is created from a storyboard or nib file
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    // This method is called when you create the button programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    // MARK: - Customization

    private func setupButton() {
        // Add any customizations here
        setTitleColor(.white, for: .normal)
        backgroundColor = .lightGreen
        tintColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Calculate the corner radius based on the button's height
        layer.cornerRadius = bounds.height / 2
    }
}

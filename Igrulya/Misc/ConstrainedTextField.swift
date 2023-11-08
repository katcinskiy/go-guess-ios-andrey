//
//  ConstrainedTextField.swift
//  Igrulya
//
//  Created by Andrey on 07.11.2023.
//

import UIKit

class ConstrainedTextField: UITextField {
    // MARK: - properties

    // MARK: - Initialization

    // This method is called when the button is created from a storyboard or nib file
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
    }

    // This method is called when you create the button programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }

    // MARK: - Customization

    private func setupTextField() {
        // Add any customizations here
        backgroundColor = .white
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = bounds.height / 2
    }

    let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}

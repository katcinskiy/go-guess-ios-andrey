//
//  DataViewController.swift
//  Igrulya
//
//  Created by Andrey on 09.10.2023.
//

import UIKit

class DataViewController: UIViewController {
    @IBOutlet var secondaryLabel: UILabel!
    @IBOutlet var mainLabel: UILabel!

    static var mainLinesNeeded = 0
    static var secondaryLinesNeeded = 0

    var mainLabelText: String!
    var mainLines = 0
    var secondaryLabelText: String!
    var secondaryLines = 0
    var buttonText: String?

    var pageIndex = 0

    override func viewDidLoad() {
        view.backgroundColor = UIColor(white: 1, alpha: 0)
        mainLabel.textColor = UIColor.white
        secondaryLabel.textColor = UIColor.white

        // TODO: set font size relative to screen
        // TODO: set font style

        for _ in mainLines ..< DataViewController.mainLinesNeeded {
            mainLabelText += "\n"
        }

        for _ in secondaryLines ..< DataViewController.secondaryLinesNeeded {
            secondaryLabelText += "\n"
        }

        mainLabel.text = mainLabelText
        secondaryLabel.text = secondaryLabelText

        mainLabel.textAlignment = .center
//        mainLabel.layer.borderColor = UIColor.black.cgColor
//        mainLabel.layer.borderWidth = 1
        secondaryLabel.textAlignment = .center
//        secondaryLabel.layer.borderColor = UIColor.black.cgColor
//        secondaryLabel.layer.borderWidth = 1

        mainLabel.numberOfLines = 0
        secondaryLabel.numberOfLines = 0

        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            secondaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondaryLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            secondaryLabel.widthAnchor.constraint(equalTo: view.widthAnchor),

            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainLabel.bottomAnchor.constraint(equalTo: secondaryLabel.topAnchor, constant: -60),
        ])
    }
}

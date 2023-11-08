//
//  SettingsViewController.swift
//  Igrulya
//
//  Created by Andrey on 01.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var profileView: UIView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var levelBarView: UIView!
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var levelBar: UIProgressView!
    @IBOutlet var nextLevelView: UIView!
    @IBOutlet var userNameTextField: ConstrainedTextField!
    @IBOutlet var updateButton: ConstrainedButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        profileView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        levelBar.translatesAutoresizingMaskIntoConstraints = false
        levelBarView.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        nextLevelView.translatesAutoresizingMaskIntoConstraints = false

        let profileViewSize = FigmaMeta.Main.Settings.profileView
        let levelBarSize = FigmaMeta.Main.Settings.levelBar
        let levelBarViewSize = FigmaMeta.Main.Settings.levelBarView
        let nextLevelViewSize = FigmaMeta.Main.Settings.nextLevelView
        let userNameTextFieldSize = FigmaMeta.Main.Settings.userNameInput
        let updateButtonSize = FigmaMeta.Main.Settings.updateButton

        levelBarView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        levelBarView.layer.borderWidth = 1

        levelBar.progress = 0.3
        levelBar.tintColor = .lightGreen
        levelBar.trackTintColor = .lightGray
        levelBar.progressViewStyle = .default
        levelBar.layer.cornerRadius = levelBarSize.height / 2
        levelBar.clipsToBounds = true

        nextLevelView.layer.cornerRadius = nextLevelViewSize.height / 2

        // Create a container view with padding
        let rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        // Create an icon view
        let iconImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        iconImageView.image = UIImage(systemName: "pencil")

        // Add the icon to the container view
        rightViewContainer.addSubview(iconImageView)

        // Set the container view as the right view of the text field
        userNameTextField.rightView = rightViewContainer
        userNameTextField.rightViewMode = .always

        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.topAnchor, constant: profileViewSize.top),
            profileView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: profileViewSize.left),
            profileView.widthAnchor.constraint(equalToConstant: profileViewSize.width),
            profileView.heightAnchor.constraint(equalToConstant: profileViewSize.height),

            userNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: FigmaMeta.Main.Settings.userNameLabel.top),
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            levelBar.topAnchor.constraint(equalTo: view.topAnchor, constant: levelBarSize.top),
            levelBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: levelBarSize.left),
            levelBar.widthAnchor.constraint(equalToConstant: levelBarSize.width),
            levelBar.heightAnchor.constraint(equalToConstant: levelBarSize.height),

            nextLevelView.topAnchor.constraint(equalTo: view.topAnchor, constant: nextLevelViewSize.top),
            nextLevelView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: nextLevelViewSize.left),
            nextLevelView.widthAnchor.constraint(equalToConstant: nextLevelViewSize.width),
            nextLevelView.heightAnchor.constraint(equalToConstant: nextLevelViewSize.height),

            levelBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: levelBarViewSize.top),
            levelBarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: levelBarViewSize.left),
            levelBarView.widthAnchor.constraint(equalToConstant: levelBarViewSize.width),
            levelBarView.heightAnchor.constraint(equalToConstant: levelBarViewSize.height),

            levelLabel.leftAnchor.constraint(equalTo: levelBarView.leftAnchor),
            levelLabel.topAnchor.constraint(equalTo: levelBarView.topAnchor),

            userNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: userNameTextFieldSize.top),
            userNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: userNameTextFieldSize.left),
            userNameTextField.widthAnchor.constraint(equalToConstant: userNameTextFieldSize.width),
            userNameTextField.heightAnchor.constraint(equalToConstant: userNameTextFieldSize.height),

            updateButton.topAnchor.constraint(equalTo: view.topAnchor, constant: updateButtonSize.top),
            updateButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: updateButtonSize.left),
            updateButton.widthAnchor.constraint(equalToConstant: updateButtonSize.width),
            updateButton.heightAnchor.constraint(equalToConstant: updateButtonSize.height),
        ])

        print("Settings loaded")
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}

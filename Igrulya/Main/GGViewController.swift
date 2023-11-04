//
//  GGViewController.swift
//  Igrulya
//
//  Created by Andrey on 01.11.2023.
//

import UIKit

class GGViewController: UIViewController {
    @IBOutlet var gamesAndTimeLabel: UILabel!
    @IBOutlet var countriesLabel: UILabel!
    @IBOutlet var scoreView: UIView!
    @IBOutlet var visitedCountriesView: UIView!
    @IBOutlet var ratingButton: ConstrainedButton!
    @IBOutlet var exploreButton: ConstrainedButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGreen

        let scoreViewSize = FigmaMeta.Main.GG.scoreView
        let visitedCountriesViewSize = FigmaMeta.Main.GG.visitedCountriesView
        let ratingButtonSize = FigmaMeta.Main.GG.ratingButton
        let exploreButtonSize = FigmaMeta.Main.GG.exploreButton

        gamesAndTimeLabel.textColor = .white
        gamesAndTimeLabel.numberOfLines = 2
        gamesAndTimeLabel.textAlignment = .left
        gamesAndTimeLabel.text = """
        Available Games 0/100
        Time to Update Game 00:00:00
        """
        gamesAndTimeLabel.translatesAutoresizingMaskIntoConstraints = false

        scoreView.heightAnchor.constraint(equalToConstant: scoreViewSize.height).isActive = true
        scoreView.widthAnchor.constraint(equalToConstant: scoreViewSize.width).isActive = true
        scoreView.translatesAutoresizingMaskIntoConstraints = false

        countriesLabel.textColor = .white
        countriesLabel.font = UIFont.boldSystemFont(ofSize: countriesLabel.font.pointSize)
        countriesLabel.translatesAutoresizingMaskIntoConstraints = false

        visitedCountriesView.heightAnchor.constraint(equalToConstant: visitedCountriesViewSize.height).isActive = true
        visitedCountriesView.widthAnchor.constraint(equalToConstant: visitedCountriesViewSize.width).isActive = true
        visitedCountriesView.translatesAutoresizingMaskIntoConstraints = false

        ratingButton.heightAnchor.constraint(equalToConstant: ratingButtonSize.height).isActive = true
        ratingButton.widthAnchor.constraint(equalToConstant: ratingButtonSize.width).isActive = true
        ratingButton.backgroundColor = UIColor.lightGreen
        ratingButton.layer.borderColor = UIColor.white.cgColor
        ratingButton.layer.borderWidth = 1

        exploreButton.heightAnchor.constraint(equalToConstant: exploreButtonSize.height).isActive = true
        exploreButton.widthAnchor.constraint(equalToConstant: exploreButtonSize.width).isActive = true
        exploreButton.backgroundColor = .white
        exploreButton.tintColor = .lightGreen

        var diff: Double = 0

        diff = 24
        let scoreViewRigthAnchorConstant = view.frame.size.width / FigmaMeta.screen.width * diff

        diff = FigmaMeta.screen.width - (274 + FigmaMeta.Main.GG.scoreView.width)
        let gamesAndTimeLabelLeftAnchorConstant = view.frame.size.width / FigmaMeta.screen.width * diff

        diff = 317.52 - 200 // TODO: move Figma
        let countriesLabelConstant = view.frame.size.height / FigmaMeta.screen.height * diff

        diff = 581 - 317.52 // TODO: move Figma
        let visitedCountriesViewTopAnchorConstant = view.frame.size.height / FigmaMeta.screen.height * diff

        diff = 659 - 581 // TODO: move Figma
        let ratingTopAnchorConstant = view.frame.size.height / FigmaMeta.screen.height * diff

        diff = 769 - 659 // TODO: move Figma
        let exploreTopAnchorConstant = view.frame.size.height / FigmaMeta.screen.height * diff

        NSLayoutConstraint.activate([
            gamesAndTimeLabel.topAnchor.constraint(equalTo: scoreView.topAnchor),
            gamesAndTimeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: gamesAndTimeLabelLeftAnchorConstant),
            gamesAndTimeLabel.rightAnchor.constraint(equalTo: scoreView.leftAnchor),

            scoreView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scoreView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -scoreViewRigthAnchorConstant),

            countriesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countriesLabel.topAnchor.constraint(equalTo: visitedCountriesView.topAnchor, constant: -countriesLabelConstant),

            visitedCountriesView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            visitedCountriesView.topAnchor.constraint(equalTo: ratingButton.topAnchor, constant: -visitedCountriesViewTopAnchorConstant),

            ratingButton.topAnchor.constraint(equalTo: exploreButton.topAnchor, constant: -ratingTopAnchorConstant),
            ratingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            exploreButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -exploreTopAnchorConstant),
            exploreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        ratingButton.contentHorizontalAlignment = .left

//        print("view.safeAreaLayoutGuide.layoutFrame --> \(view.safeAreaLayoutGuide.layoutFrame)")
//        print("view.frame --> \(view.frame)")
//        print("tabBarController?.tabBar.frame --> \(tabBarController?.tabBar.frame)")
//        print("tabBarController?.view.frame --> \(tabBarController?.view.frame)")
//        print("FigmaSizes.deviceScreen --> \(FigmaSizes.deviceScreen)")
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

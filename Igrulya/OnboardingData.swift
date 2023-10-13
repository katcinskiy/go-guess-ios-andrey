//
//  OnboardingData.swift
//  Igrulya
//
//  Created by Andrey on 09.10.2023.
//

import UIKit

let testJsonString = """
[
    {
        "mainText": "Let’s Explore The World!",
        "secondaryText": "Embark on a global journey from Paris to Machu Picchu, with immersive 360° views and test your geographic knowledge.",
        "buttonText": null
    },
    {
        "mainText": "Join the Adventure!",
        "secondaryText": "Become a Sherlock in thrilling competitions. Observe, explore, and search for clues to outsmart your opponents!",
        "buttonText": null

    },
    {
        "mainText": "Guess where you are?",
        "secondaryText": "Observe closely and search for any signs that will help you understand where you are.",
        "buttonText": "Start Game"
    }
]
"""

struct MyData: Codable {
    let mainText: String
    let secondaryText: String
    let buttonText: String?
}

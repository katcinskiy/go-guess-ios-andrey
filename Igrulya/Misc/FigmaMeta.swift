//
//  FigmaMeta.swift
//  Igrulya
//
//  Created by Andrey on 02.11.2023.
//

import UIKit

struct FigmaInfo {
    let width: CGFloat
    let height: CGFloat
    let top: CGFloat
    let left: CGFloat
}

struct DeviceInfo {
    let width: CGFloat
    let height: CGFloat
    let top: CGFloat
    let left: CGFloat
}

enum FigmaMeta {
//    let screenHeight = screenRect.size.height
    static var deviceScreen: CGSize { // IOS
        UIScreen.main.bounds.size
    }

    // TODO: Ratio for Label.text/fontSize
    // TODO: Ratio for NSLayoutConstraints
    // TODO: Position

    private static func convertRatio(from: FigmaInfo) -> DeviceInfo {
        let height = FigmaMeta.deviceScreen.height / FigmaMeta.screen.height * from.height
        let width = FigmaMeta.deviceScreen.width / FigmaMeta.screen.width * from.width
        let top = FigmaMeta.deviceScreen.height / FigmaMeta.screen.height * from.top
        let left = FigmaMeta.deviceScreen.width / FigmaMeta.screen.width * from.left
        return DeviceInfo(width: width, height: height, top: top, left: left)
    }

    static let screen: CGSize = .init(width: 390, height: 844)

    enum Onboarding {
        static var startButton: DeviceInfo {
            let figmaInfo = FigmaInfo(width: 223, height: 58, top: 727, left: 83.5)
            return convertRatio(from: figmaInfo)
        }

        static var nextButton: DeviceInfo {
            let figmaInfo = FigmaInfo(width: 46, height: 46, top: 733, left: 172)
            return convertRatio(from: figmaInfo)
        }

        static var progressBar: DeviceInfo {
            let figmaInfo = FigmaInfo(width: 76, height: 76, top: 718, left: 157)
            return convertRatio(from: figmaInfo)
        }
    }

    enum Main {
        enum GG {
            static var exploreButton: DeviceInfo {
                let figmaInfo = FigmaInfo(width: 342, height: 58, top: 659, left: 24)
                return convertRatio(from: figmaInfo)
            }

            static var ratingButton: DeviceInfo {
                let figmaInfo = FigmaInfo(width: 342, height: 58, top: 581, left: 24)
                return convertRatio(from: figmaInfo)
            }

            static var visitedCountriesView: DeviceInfo {
                let figmaInfo = FigmaInfo(width: 350, height: 208.97, top: 317.52, left: 20)
                return convertRatio(from: figmaInfo)
            }

            static var scoreView: DeviceInfo {
                let figmaInfo = FigmaInfo(width: 92.09, height: 44, top: 74.14, left: 274)
                return convertRatio(from: figmaInfo)
            }
        }

        enum Settings {
            static var profileView: DeviceInfo {
                let figmaInfo = FigmaInfo(width: 0, height: 0, top: 0, left: 0)
                return convertRatio(from: figmaInfo)
            }

            static var ratingButton: DeviceInfo {
                let figmaInfo = FigmaInfo(width: 0, height: 0, top: 0, left: 0)
                return convertRatio(from: figmaInfo)
            }

            static var visitedCountriesView: DeviceInfo {
                let figmaInfo = FigmaInfo(width: 0, height: 0, top: 0, left: 0)
                return convertRatio(from: figmaInfo)
            }

            static var scoreView: DeviceInfo {
                let figmaInfo = FigmaInfo(width: 0, height: 0, top: 0, left: 0)
                return convertRatio(from: figmaInfo)
            }
        }
    }
}

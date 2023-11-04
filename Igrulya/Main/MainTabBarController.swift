//
//  MainTabBarController.swift
//  Igrulya
//
//  Created by Andrey on 01.11.2023.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstTitle = viewControllers?.first?.title
        navigationItem.title = firstTitle
        delegate = self
    }

    func tabBarController(_: UITabBarController, didSelect viewController: UIViewController) {
        print("tabBarController didSelect \(viewController.tabBarItem.tag)")
        navigationItem.title = viewController.title
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

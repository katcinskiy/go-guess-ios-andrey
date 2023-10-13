//
//  CustomPageViewController.swift
//  Igrulya
//
//  Created by Andrey on 08.10.2023.
//

import UIKit

class CustomPageViewController: UIPageViewController, UIScrollViewDelegate {
    var onboardingViewController: OnboardingViewController?
    var swipingFromPage: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        for subview in view.subviews {
            if let scrollView = subview as? UIScrollView {
                scrollView.delegate = self // onboardingViewController
            }
        }

        setupPageControl()
    }

    func setupPageControl() {
        let pageControlAppearance = UIPageControl.appearance()
        // TODO: get color
        view.backgroundColor = UIColor(red: 156 / 255, green: 200 / 255, blue: 101 / 255, alpha: 1.0)
        pageControlAppearance.pageIndicatorTintColor = UIColor.lightGray
        pageControlAppearance.currentPageIndicatorTintColor = UIColor.white
    }

    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        if let currentViewController = viewControllers?[0] {
            if let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) {
                setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
            }
        }
        print("goToNextPage")
    }

    func goToPreviousPage(animated _: Bool = true, completion: ((Bool) -> Void)? = nil) {
        if let currentViewController = viewControllers?[0] {
            if let previousPage = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) {
                setViewControllers([previousPage], direction: .reverse, animated: true, completion: completion)
            }
        }

        print("goToPreviousPage")
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let ovc = parent as? OnboardingViewController else {
            return
        }

        let currentPageIndex = swipingFromPage
        let countOfProgresses = ovc.dvcList.count - 1
        let currentProgressBegin = CGFloat(currentPageIndex) / CGFloat(countOfProgresses)

        let point = scrollView.contentOffset
        let offsetX = point.x
        var percentComplete: CGFloat
        percentComplete = (point.x - view.frame.size.width) / view.frame.size.width
        percentComplete = percentComplete / CGFloat(countOfProgresses)
        // print("\(percentComplete)--\(currentProgressBegin)--\(currentPageIndex)")
        percentComplete += currentProgressBegin
        // print("\(currentPageIndex)--\(countOfProgresses) percentComplete: ", percentComplete)

        ovc.progressView.progress = Float(percentComplete)

        ovc.progressView.isHidden = ovc.progressView.progress == 1.0
    }
}

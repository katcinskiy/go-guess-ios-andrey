import UIKit

class OnboardingViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var contentView: UIView!
    @IBOutlet var buttonView: UIView!
    @IBOutlet var nextButton: ConstrainedButton!
    var progressView: CircularProgressView!
    var dvcList: [DataViewController] = []

    var customPageViewController: CustomPageViewController!
    var nextButtonWidthConstraint: NSLayoutConstraint?
    var nextButtonHeightConstraint: NSLayoutConstraint?

    @IBAction func onTap(_: Any) {
        guard let dvc = customPageViewController.viewControllers?.first as? DataViewController else {
            return
        }

        if let currentIndex = dvcList.firstIndex(of: dvc) {
//            print("Button swipe from page \(currentIndex)")
            customPageViewController.swipingFromPage = currentIndex

            if currentIndex == dvcList.count - 1 {
                // Assuming you have a storyboard named "Main" and a view controller with the identifier "NewViewController"
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(withIdentifier: "mainTabBarController") as! MainTabBarController

                navigationController?.setViewControllers([mainTabBarController], animated: true)
                navigationController?.tabBarItem.badgeColor = UIColor.red
            }
        }

        customPageViewController.goToNextPage(animated: true, completion: animationFinish)
    }

    func setNextButtonAttribures(state: Int) {
        nextButtonHeightConstraint?.isActive = false
        nextButtonWidthConstraint?.isActive = false

        if state == dvcList.count - 1 {
            let buttonSize = FigmaMeta.Onboarding.startButton
            nextButtonHeightConstraint = nextButton.heightAnchor.constraint(equalToConstant: buttonSize.height)
            nextButtonWidthConstraint = nextButton.widthAnchor.constraint(equalToConstant: buttonSize.width)
        } else {
            let buttonSize = FigmaMeta.Onboarding.nextButton
            nextButtonHeightConstraint = nextButton.heightAnchor.constraint(equalToConstant: buttonSize.width)
            nextButtonWidthConstraint = nextButton.widthAnchor.constraint(equalTo: nextButton.heightAnchor)
        }

        nextButtonWidthConstraint?.isActive = true
        nextButtonHeightConstraint?.isActive = true

        let title = dvcList[state].buttonText ?? ">"
        nextButton.setTitle(title, for: UIControl.State.normal)
        animateButton()
    }

    fileprivate func configureProgressView() {
        let progressSize = FigmaMeta.Onboarding.progressBar
        progressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: progressSize.width, height: progressSize.width), lineWidth: 3, rounded: true)
        progressView.progressColor = UIColor.white
        progressView.trackColor = UIColor.lightGray
        progressView.center = buttonView.center
        progressView.progress = 0
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.heightAnchor.constraint(equalToConstant: progressSize.width).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: progressSize.width).isActive = true

        buttonView.addSubview(progressView)
        buttonView.sendSubviewToBack(progressView)
    }

    fileprivate func setConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: buttonView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            buttonView.topAnchor.constraint(equalTo: contentView.bottomAnchor),
            buttonView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15),

            nextButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),

            progressView.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            progressView.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
        ])
    }

    fileprivate func setColors() {
        buttonView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        // TODO: get color
        view.backgroundColor = .lightGreen
        nextButton.backgroundColor = UIColor.white
        nextButton.tintColor = .lightGreen
        nextButton.setTitleColor(.lightGreen, for: .normal)
        contentView.backgroundColor = UIColor(white: 0, alpha: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setColors()

        configureProgressView()

        setConstraints()

        configurePageViewController()
        setNextButtonAttribures(state: 0)
    }

    @objc func animateButton() {
        // Animate the constraint change
        UIView.animate(withDuration: 0.5) {
            self.buttonView.layoutIfNeeded() // Forces an immediate layout of the view hierarchy
        }
    }

    func configurePageViewController() {
        guard let cpvc = storyboard?.instantiateViewController(withIdentifier: String(describing: CustomPageViewController.self)) as? CustomPageViewController else {
            return
        }

        customPageViewController = cpvc

        cpvc.onboardingViewController = self

        cpvc.delegate = self
        cpvc.dataSource = self

        addChild(customPageViewController)
        cpvc.didMove(toParent: self)

        cpvc.view.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(cpvc.view)

        NSLayoutConstraint.activate([
            cpvc.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            cpvc.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cpvc.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cpvc.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])

        let jsonData = testJsonString.data(using: .utf8)!

        guard let onboardingDataArray = try? JSONDecoder().decode([MyData].self, from: jsonData) else {
            print("Error decoding JSON")
            return
        }

        if onboardingDataArray.isEmpty {
            print("No JSON data")
            return
        }

        for (idx, onboardingData) in onboardingDataArray.enumerated() {
            guard let dvc = storyboard?.instantiateViewController(withIdentifier: String(describing: DataViewController.self)) as? DataViewController else {
                return
            }

            if onboardingData.buttonText != nil {}

            dvc.pageIndex = idx

            dvc.mainLabelText = onboardingData.mainText
            dvc.secondaryLabelText = onboardingData.secondaryText
            dvc.buttonText = onboardingData.buttonText

            dvcList.append(dvc)

            dvc.mainLines = countLines(dvc.mainLabelText)
            dvc.secondaryLines = countLines(dvc.secondaryLabelText)
            DataViewController.mainLinesNeeded = max(dvc.mainLines, DataViewController.mainLinesNeeded)
            DataViewController.secondaryLinesNeeded = max(dvc.secondaryLines, DataViewController.secondaryLinesNeeded)
        }

        cpvc.setViewControllers([dvcList.first! as UIViewController], direction: .forward, animated: true, completion: nil)

        func countLines(_ text: String) -> Int {
            // TODO: get font from JSON
            let label = UILabel()
            let rect = CGSize(width: contentView.bounds.width, height:
                CGFloat.greatestFiniteMagnitude)
            let labelSize = text.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: label.font as Any], context: nil)
            return Int(ceil(labelSize.height / label.font.lineHeight))
        }
    }
}

extension OnboardingViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func presentationIndex(for pvc: UIPageViewController) -> Int {
        guard let dvc = pvc.viewControllers?.first as? DataViewController else {
            print("Alarm!")
            return 0
        }

        return dvc.pageIndex
    }

    func presentationCount(for _: UIPageViewController) -> Int {
        dvcList.count
    }

    func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let dvc = viewController as? DataViewController else {
            return nil
        }

        guard let currentIndex = dvcList.firstIndex(of: dvc) else {
            return nil
        }

        if currentIndex == 0 {
            return nil
        }

        return dvcList[currentIndex - 1]
    }

    func pageViewController(_: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let dvc = viewController as? DataViewController else {
            return nil
        }

        guard let currentIndex = dvcList.firstIndex(of: dvc) else {
            return nil
        }

        if currentIndex == dvcList.count - 1 {
            return nil
        }

        return dvcList[currentIndex + 1]
    }

    // TODO: change to runtime
    // currently used for change button layout
    fileprivate func animationFinish(_ completed: Bool) {
//        print("completed \(completed)")
        if completed {
            guard let dvc = customPageViewController.viewControllers?.first as? DataViewController else {
                return
            }

            setNextButtonAttribures(state: dvc.pageIndex)
            customPageViewController.swipingFromPage = dvc.pageIndex
        }
    }

    func pageViewController(_: UIPageViewController, didFinishAnimating _: Bool, previousViewControllers _: [UIViewController], transitionCompleted completed: Bool) {
        animationFinish(completed)
        // TODO: if completed FALSE then undo change from START_BUTTON TO NEXT_BUTTON
    }

    // Use to determine which page we're swiping from (for determinating progress offset)
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo _: [UIViewController]) {
        // Get the current page index before the transition
        if let currentViewController = pageViewController.viewControllers?.first as? DataViewController,
           let currentIndex = dvcList.firstIndex(of: currentViewController)
        {
            print("Swiping from page \(currentIndex)")
            customPageViewController.swipingFromPage = currentIndex
        }
    }
}

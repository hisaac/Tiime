// Created by Isaac Halvorson on 8/30/18

import UIKit

protocol MasterCoordinator: class, Coordinator {
	func showDetail(_ viewController: UIViewController)
}

class ApplicationCoordinator: MasterCoordinator {

	let window: UIWindow
	let rootViewController: UISplitViewController
	let masterNavigationController: UINavigationController
	let clockListCoordinator: ClockListCoordinator

	init(window: UIWindow) {
		self.window = window
		rootViewController = UISplitViewController()
		masterNavigationController = UINavigationController()
		masterNavigationController.navigationBar.prefersLargeTitles = true

		clockListCoordinator = ClockListCoordinator(presenter: masterNavigationController)
	}

	func start() {
		let emptyDetailNavController = EmptyDetailViewController().embedInNavigationController(prefersLargeTitles: false)
		rootViewController.viewControllers = [masterNavigationController, emptyDetailNavController]

		rootViewController.delegate = self
		rootViewController.preferredDisplayMode = .allVisible

		clockListCoordinator.start()
		clockListCoordinator.delegate = self

		window.rootViewController = rootViewController
		window.tintColor = UIColor.HIGColors.purple
		window.makeKeyAndVisible()
	}

	func showDetail(_ viewController: UIViewController) {
		var detailViewController = viewController

		if !rootViewController.isCollapsed {
			detailViewController = detailViewController.embedInNavigationController(prefersLargeTitles: false)
		}

		rootViewController.showDetailViewController(detailViewController, sender: self)
	}
}

extension UIViewController {
	func embedInNavigationController(prefersLargeTitles: Bool = true) -> UINavigationController {
		let navigationController = UINavigationController()
		navigationController.navigationBar.prefersLargeTitles = prefersLargeTitles
		navigationController.viewControllers = [self]
		return navigationController
	}
}

extension ApplicationCoordinator: UISplitViewControllerDelegate {

	/// Returning true here forces the primary view controller to be shown in compact mode on initial launch
	func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
		return true
	}

	/// Displays the detail view controller differently based on if the view is compact or normal
	func splitViewController(_ splitViewController: UISplitViewController, showDetail vc: UIViewController, sender: Any?) -> Bool {
		if splitViewController.isCollapsed {
			guard let rootNavigationController = rootViewController.viewControllers.first as? UINavigationController else {
				return false
			}

			rootNavigationController.pushViewController(vc, animated: true)
			return true
		}

		return false
	}

}

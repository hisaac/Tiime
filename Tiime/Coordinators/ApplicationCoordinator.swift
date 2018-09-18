// Created by Isaac Halvorson on 8/30/18

import UIKit

protocol MasterCoordinator: class, Coordinator {
	func showDetail(_ viewController: UIViewController)
}

class ApplicationCoordinator: MasterCoordinator {

	let window: UIWindow
	let rootViewController: UISplitViewController
	let masterTabBarController: UITabBarController
	let clockListCoordinator: ClockListCoordinator
	let settingsCoordinator: SettingsCoordinator

	init(window: UIWindow) {
		self.window = window
		rootViewController = UISplitViewController()
		masterTabBarController = UITabBarController()
		clockListCoordinator = ClockListCoordinator(presenter: masterTabBarController)
		settingsCoordinator = SettingsCoordinator(presenter: masterTabBarController)
	}

	func start() {
		let emptyDetailNavController = EmptyDetailViewController().embedInNavigationController(prefersLargeTitles: false)
		rootViewController.viewControllers = [masterTabBarController, emptyDetailNavController]

		rootViewController.delegate = self
		rootViewController.preferredDisplayMode = .allVisible

		clockListCoordinator.start()
		clockListCoordinator.delegate = self

		settingsCoordinator.start()
		settingsCoordinator.delegate = self

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

extension ApplicationCoordinator: UISplitViewControllerDelegate {

	/// Returning true here forces the primary view controller to be shown in compact mode on initial launch
	func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
		return true
	}

	/// Displays the detail view controller differently based on if the view is compact or normal
	/// via: https://stackoverflow.com/a/46012353/4118208
	///
	func splitViewController(_ splitViewController: UISplitViewController, showDetail vc: UIViewController, sender: Any?) -> Bool {
		if splitViewController.isCollapsed {
			guard let tabBarController = splitViewController.viewControllers.first as? UITabBarController else { return false }

			// swiftlint:disable:next line_length
			guard let selectedNavigationController = tabBarController.selectedViewController as? UINavigationController else { return false }

			// Push view controller
			var detailViewController = vc
			if let navController = vc as? UINavigationController, let topViewController = navController.topViewController {
				detailViewController = topViewController
			}

			selectedNavigationController.pushViewController(detailViewController, animated: true)
			return true
		}

		return false
	}

}

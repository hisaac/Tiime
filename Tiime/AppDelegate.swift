//
// AppDelegate.swift
// Created by Isaac Halvorson on 4/15/18
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
	var window: UIWindow?

	// swiftlint:disable:next line_length
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = buildInitialUI()
		window?.tintColor = UIColor.HIGColors.purple
		window?.makeKeyAndVisible()
		return true
	}

	func buildInitialUI() -> UIViewController {
		let mainSplitViewController = UISplitViewController()
		let masterNavigationController = MasterNavigationController()
		let detailNavigationController = DetailNavigationController()

		mainSplitViewController.delegate = self
		mainSplitViewController.viewControllers = [
			masterNavigationController,
			detailNavigationController
		]

		return mainSplitViewController
	}

	// swiftlint:disable:next line_length
	func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
		return true
	}
}

//
// AppDelegate.swift
// Created by Isaac Halvorson on 4/15/18
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
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
		let detailNavigationController = DetailNavigationController(rootViewController: EmptyDetailViewController())

		mainSplitViewController.preferredDisplayMode = .allVisible
		mainSplitViewController.viewControllers = [
			masterNavigationController,
			detailNavigationController
		]

		return mainSplitViewController
	}
}

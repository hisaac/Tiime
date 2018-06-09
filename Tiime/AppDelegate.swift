//
// AppDelegate.swift
// Created by Isaac Halvorson on 4/15/18
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
	var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

	// swiftlint:disable:next line_length
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		window?.rootViewController = buildInitialUI()
		window?.tintColor = UIColor.HIGColors.purple
		window?.makeKeyAndVisible()
		return true
	}

	func buildInitialUI() -> UIViewController {
		let clockListNavigationController = MasterNavigationController()
		let settingsViewController = UIViewController()

		let masterTabBarViewController = UITabBarController()
		masterTabBarViewController.viewControllers = [
			clockListNavigationController,
			settingsViewController
		]

		let detailViewController = UINavigationController()

		let mainSplitViewController = UISplitViewController()
		mainSplitViewController.delegate = self
		mainSplitViewController.viewControllers = [
			masterTabBarViewController,
			detailViewController
		]

		return mainSplitViewController
	}
}

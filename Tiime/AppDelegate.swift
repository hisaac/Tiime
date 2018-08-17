//
// AppDelegate.swift
// Created by Isaac Halvorson on 4/15/18
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
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

		mainSplitViewController.viewControllers = [
			masterNavigationController,
			detailNavigationController
		]
		mainSplitViewController.preferredDisplayMode = .allVisible

		return mainSplitViewController
	}
}

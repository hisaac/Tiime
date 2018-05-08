//
// AppDelegate.swift
// Created by Isaac Halvorson on 4/15/18
//

import UIKit
import TiimeKit
import TiimeUIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	// swiftlint:disable:next line_length
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let mainNavigationController = UINavigationController()
		mainNavigationController.navigationBar.prefersLargeTitles = true
		let clockListViewController = ClockListViewController()
		mainNavigationController.pushViewController(clockListViewController, animated: false)
		//		let initialTimeType = MainDependencyContainer.makeTimeRepresentable()
		//		let initialClockViewController = ClockViewController(timeType: initialTimeType)
		//		mainNavigationController.pushViewController(initialClockViewController, animated: false)

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.rootViewController = mainNavigationController

		return true
	}
}

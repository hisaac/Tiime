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
		window?.rootViewController = MainNavigationController()
		window?.makeKeyAndVisible()
		return true
	}
}

//
//  AppDelegate.swift
//  Tiime
//
//  Created by Isaac Halvorson on 4/15/18.
//  Copyright © 2018 Levelsoft. All rights reserved.
//

// swiftformat:disable unusedArguments

import UIKit
import TiimeKit
import TiimeUIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	// swiftlint:disable:next line_length
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		initializeViews()
		return true
	}

	func initializeViews() {
		let mainNavigationController = UINavigationController()
		let initialTimeType = MainDependencyContainer.makeTimeRepresentable()
		let initialClockViewController = ClockViewController(timeType: initialTimeType)
		mainNavigationController.pushViewController(initialClockViewController, animated: false)

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = mainNavigationController
		window?.makeKeyAndVisible()
	}
}

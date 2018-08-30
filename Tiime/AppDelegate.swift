// Created by Isaac Halvorson on 4/15/18

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	private var applicationCoordinator: ApplicationCoordinator?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let window = UIWindow(frame: UIScreen.main.bounds)
		let applicationCoordinator = ApplicationCoordinator(window: window)

		self.window = window
		self.applicationCoordinator = applicationCoordinator

		applicationCoordinator.start()

		return true
	}

}

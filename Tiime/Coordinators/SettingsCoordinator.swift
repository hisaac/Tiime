// Created by Isaac Halvorson on 9/18/18

import UIKit

class SettingsCoordinator: Coordinator {

	weak var delegate: MasterCoordinator?
	private let presenter: UITabBarController
	private lazy var settingsViewController = makeSettingsViewController()

	init(presenter: UITabBarController) {
		self.presenter = presenter
	}

	func makeSettingsViewController() -> UITableViewController {
		return UITableViewController(style: .grouped)
	}

	func start() {
		presenter.viewControllers?.append(settingsViewController.embedInNavigationController())
	}
}

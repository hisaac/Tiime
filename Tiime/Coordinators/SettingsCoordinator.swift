// Created by Isaac Halvorson on 9/18/18

import UIKit

class SettingsCoordinator: Coordinator {

	weak var delegate: MasterCoordinator?
	private let presenter: UINavigationController
	private lazy var settingsViewController = makeSettingsViewController()

	init(presenter: UINavigationController) {
		self.presenter = presenter
	}

	func makeSettingsViewController() -> UITableViewController {
		return SettingsViewController(style: .grouped)
	}

	func start() {
		presenter.present(settingsViewController.embedInNavigationController(), animated: true, completion: nil)
	}

}

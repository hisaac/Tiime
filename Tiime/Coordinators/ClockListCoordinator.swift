// Created by Isaac Halvorson on 8/30/18

import UIKit

class ClockListCoordinator: Coordinator {

	weak var delegate: MasterCoordinator?
	private let presenter: UINavigationController
	private lazy var clockListViewController = makeClockListViewController()

	init(presenter: UINavigationController) {
		self.presenter = presenter
	}

	private func makeClockListViewController() -> ClockListViewController {
		let clockListViewController = ClockListViewController()
		clockListViewController.delegate = self
		return clockListViewController
	}

	func start() {
		presenter.viewControllers = [clockListViewController]
	}

}

extension ClockListCoordinator: ClockListViewControllerDelegate {

	func clockListViewControllerDidSelectClockType(_ clockType: ClockType) {
		let clockDetailViewController = ClockViewController(timeType: clockType.rawValue)
		delegate?.showDetail(clockDetailViewController)
	}

	func showSettings() {
		delegate?.showSettings()
	}

}

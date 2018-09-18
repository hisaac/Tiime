// Created by Isaac Halvorson on 8/30/18

import UIKit

class ClockListCoordinator: Coordinator {

	weak var delegate: MasterCoordinator?
	private let presenter: UITabBarController
	private lazy var clockListViewController = makeClockListViewController()

	init(presenter: UITabBarController) {
		self.presenter = presenter
	}

	private func makeClockListViewController() -> ClockListViewController {
		let clockListViewController = ClockListViewController(style: .grouped)
		clockListViewController.delegate = self
		return clockListViewController
	}

	func start() {
		presenter.viewControllers = [clockListViewController.embedInNavigationController()]
	}

}

extension ClockListCoordinator: ClockListViewControllerDelegate {
	func clockListViewControllerDidSelectClockType(_ clockType: ClockType) {
		let clockDetailViewController = ClockViewController(timeType: clockType.timeRepresentable)
		delegate?.showDetail(clockDetailViewController)
	}
}

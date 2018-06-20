// Created by Isaac Halvorson on 6/9/18

import UIKit

class MasterNavigationController: UINavigationController, UISplitViewControllerDelegate {
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always
		splitViewController?.delegate = self

		let clockListViewController = ClockListViewController(style: .grouped)
		pushViewController(clockListViewController, animated: false)
	}

	// swiftlint:disable:next line_length
	func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
		return true
	}
}

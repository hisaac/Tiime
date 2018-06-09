// Created by Isaac Halvorson on 6/9/18

import UIKit

class MasterNavigationController: UINavigationController {
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationBar.prefersLargeTitles = true

		let clockListViewController = ClockListViewController(style: .grouped)
		pushViewController(clockListViewController, animated: false)
	}
}

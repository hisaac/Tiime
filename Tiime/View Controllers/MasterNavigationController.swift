// Created by Isaac Halvorson on 9/24/18

import UIKit

class MasterNavigationController: UINavigationController {

	override func separateSecondaryViewController(for splitViewController: UISplitViewController) -> UIViewController? {
		return super.separateSecondaryViewController(for: splitViewController)?.embedInNavigationController()
	}

}

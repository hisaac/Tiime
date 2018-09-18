// Created by Isaac Halvorson on 9/18/18

import UIKit

extension UIViewController {
	/// Returns the view controller embedded within a new `UINavigationController`
	func embedInNavigationController(prefersLargeTitles: Bool = true) -> UINavigationController {
		let navigationController = UINavigationController()
		navigationController.navigationBar.prefersLargeTitles = prefersLargeTitles
		navigationController.viewControllers = [self]
		return navigationController
	}
}

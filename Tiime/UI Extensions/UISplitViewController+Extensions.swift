// Created by Isaac Halvorson on 6/9/18

import UIKit

// These convenience variables taken from https://stackoverflow.com/a/25359263/4118208
extension UISplitViewController {
	var masterViewController: UIViewController? {
		return viewControllers.first
	}

	var detailViewController: UIViewController? {
		return viewControllers.count > 1 ? viewControllers[1] : nil
	}
}

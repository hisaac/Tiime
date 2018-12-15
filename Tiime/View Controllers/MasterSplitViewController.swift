// Created by Isaac Halvorson on 12/15/18

import UIKit

class MasterSplitViewController: UISplitViewController {

	// Override this value so that the status bar style correctly updates when the theme changes
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return Theme.current.preferredStatusBarStyle
	}
}

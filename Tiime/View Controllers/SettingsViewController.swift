// Created by Isaac Halvorson on 9/24/18

import UIKit

class SettingsViewController: UITableViewController {

	convenience init() {
		self.init(style: .grouped)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = L10n.settings

		navigationItem.largeTitleDisplayMode = .always
		navigationItem.leftBarButtonItem = UIBarButtonItem(
			barButtonSystemItem: .done,
			target: self,
			action: #selector(dismissSettings)
		)

		tableView.allowsSelection = true
	}

	@objc func dismissSettings() {
		dismiss(animated: true, completion: nil)
	}

}

// Created by Isaac Halvorson on 10/5/18

import UIKit

class SettingsViewController: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		title = NSLocalizedString("Settings", comment: "Title for Settings view")

		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(
			title: NSLocalizedString("Done", comment: "Done button on Settings view to dismiss settings"),
			style: .plain,
			target: self,
			action: #selector(dismissSettings)
		)

		buildTableView()
	}

	private func buildTableView() {

	}

	@objc private func dismissSettings() {
		dismiss(animated: true)
	}

}

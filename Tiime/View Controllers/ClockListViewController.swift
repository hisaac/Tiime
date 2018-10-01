// Created by Isaac Halvorson on 5/6/18

import UIKit

protocol ClockListViewControllerDelegate: class, Coordinator {
	func clockListViewControllerDidSelectClockType(_ clockType: ClockType)
	func showSettings()
}

class ClockListViewController: UITableViewController {

	weak var delegate: ClockListViewControllerDelegate?

	convenience init() {
		self.init(style: .grouped)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = L10n.applicationName
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ClockTypeCell")
		tableView.allowsSelection = true

		navigationItem.largeTitleDisplayMode = .always
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			title: L10n.settings,
			style: .plain,
			target: self,
			action: #selector(showSettings)
		)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationController?.hidesBarsOnTap = false
	}

	@objc func showSettings() {
		delegate?.showSettings()
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ClockType.allCases.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: "ClockTypeCell")
		cell.accessoryType = .detailDisclosureButton
		cell.textLabel?.text = ClockType.allCases[indexPath.row].name
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let clockType = ClockType.allCases[indexPath.row]
		delegate?.clockListViewControllerDidSelectClockType(clockType)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
		let alert = UIAlertController(
			title: ClockType.allCases[indexPath.row].name,
			message: ClockType.allCases[indexPath.row].description,
			preferredStyle: .alert
		)

		let dismissAction = UIAlertAction(
			title: L10n.dismiss,
			style: .cancel,
			handler: nil
		)

		alert.addAction(dismissAction)

		present(alert, animated: true)
	}

}

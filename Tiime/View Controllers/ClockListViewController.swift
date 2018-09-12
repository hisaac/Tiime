// Created by Isaac Halvorson on 5/6/18

import UIKit

protocol ClockListViewControllerDelegate: class, Coordinator {
	func clockListViewControllerDidSelectClockType(_ clockType: ClockType)
}

class ClockListViewController: UITableViewController {

	weak var delegate: ClockListViewControllerDelegate?

	override func viewDidLoad() {
		super.viewDidLoad()
		title = NSLocalizedString("Tiime", comment: "Title bar for main clocks list")
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ClockTypeCell")
		tableView.allowsSelection = true
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ClockType.allCases.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: "ClockTypeCell")

		cell.accessoryType = .detailDisclosureButton

		cell.textLabel?.text = ClockType.allCases[indexPath.row].name
//		cell.detailTextLabel?.text = ClockType.allCases[indexPath.row].description
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
			title: NSLocalizedString("Dismiss", comment: "Dismiss button on alert"),
			style: .cancel,
			handler: nil
		)

		alert.addAction(dismissAction)

		present(alert, animated: true)
	}

}

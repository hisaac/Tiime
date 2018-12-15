// Created by Isaac Halvorson on 12/15/18

import os.log
import UIKit

class ThemeIconPickerView: UITableViewController {

	convenience init() {
		self.init(style: .grouped)
		title = NSLocalizedString("App Icon", comment: "Title for the App Icon picker screen")
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ThemeIcon.allCases.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let icon = ThemeIcon.allCases[indexPath.row]
		let cell = UITableViewCell(style: .default, reuseIdentifier: icon.name)

		let currentIconName = UIApplication.shared.alternateIconName ?? "afternoon"
		if icon.rawValue == currentIconName {
			cell.accessoryType = .checkmark
		}

		cell.textLabel?.textColor = Theme.current.tableViewTextColor
		cell.textLabel?.text = icon.name
		cell.imageView?.image = icon.image
		cell.imageView?.layer.cornerRadius = 12
		cell.imageView?.clipsToBounds = true

		return cell
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let icon = ThemeIcon.allCases[indexPath.row]

		UIApplication.shared.setAlternateIconName(icon.rawValue) { error in
			if let error = error {
				self.osLog(.error, "Error setting alternate icon: %@", error.localizedDescription)
			} else {
				Theme.appIcon = ThemeIcon.allCases[indexPath.row]
				self.tableView.reloadData()
				self.navigationController?.popViewController(animated: true)
			}
		}
	}

	/// Convenience method for logging more easily using os_log
	private func osLog(_ type: OSLogType, _ message: StaticString, _ args: CVarArg...) {
		if #available(iOS 12.0, *) {
			os_log(type, message, args)
		} else {
			os_log(message, log: .default, type: type, args)
		}
	}

}

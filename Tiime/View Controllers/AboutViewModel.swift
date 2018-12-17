// Created by Isaac Halvorson on 12/15/18

import os.log
import UIKit

class AboutViewModel {

	@objc let aboutCell: UITableViewCell = {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)

		cell.textLabel?.text = aboutText
		cell.textLabel?.textColor = Theme.current.tableViewTextColor
		cell.textLabel?.lineBreakMode = .byWordWrapping
		cell.textLabel?.numberOfLines = 0

		return cell
	}()

	@objc var codeCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "Tiime on GitHub"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = "Visit Tiime's GitHub project for more technical information and implementation details, and to see the code"
		cell.detailTextLabel?.lineBreakMode = .byWordWrapping
		cell.detailTextLabel?.numberOfLines = 0
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	@objc var hisaacTwitterCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "@hisaac"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = "Follow the developer on Twitter"
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	@objc var isaacWebsiteCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "hisaac.net"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = "Visit the developer's website"
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	@objc var isaacEmailCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "tiime@level.software"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = "Send feedback or ideas about the app"
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	@objc var thanksRyanCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "Ryan Lower"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = "Designed the app's beautiful icons"
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	@objc var thanksEliCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "Eli Mellen"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = "QA testing and wicked helpful app feedback"
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	static let aboutText: String = {
		guard let aboutTextFilePath = Bundle.main.path(forResource: "about", ofType: "txt") else {
			return ""
		}

		do {
			let aboutText = try String(contentsOfFile: aboutTextFilePath)
			return String(aboutText.dropLast()) // Drop the last newline character
		} catch {
			if #available(iOS 12.0, *) {
				os_log(.error, "Error looking up about.txt file: %@", error.localizedDescription)
			} else {
				os_log("Error looking up about.txt file: %@", log: .default, type: .error, error.localizedDescription)
			}

			return ""
		}
	}()

}

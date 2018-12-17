// Created by Isaac Halvorson on 12/15/18

// swiftlint:disable line_length

import os.log
import UIKit

class AboutViewModel {

	@objc var aboutCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)

		cell.textLabel?.text = """
			Thanks for checking out Tiime!

			Tiime was born out of a fun programming challenge: To try to compute the current time in non-standard ways. After figuring that part out, I realized this would also be a great way to learn more about iOS development. I was especially interested in learning how to better develop user interfaces within Apple's guidelines and style.
			"""

		cell.textLabel?.textColor = Theme.current.tableViewTextColor
		cell.textLabel?.lineBreakMode = .byWordWrapping
		cell.textLabel?.numberOfLines = 0

		return cell
	}

	@objc var codeCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "Tiime on GitHub"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = "Visit Tiime's GitHub project for more information, including technical information and implementation details. All the code is open source!"
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

}

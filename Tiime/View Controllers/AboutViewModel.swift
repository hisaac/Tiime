// Created by Isaac Halvorson on 12/15/18

import os.log
import UIKit

@objcMembers
class AboutViewModel {

	var aboutCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)

		cell.textLabel?.text = NSLocalizedString(
			"aboutScreenDescription",
			comment: "About screen description"
		)

		cell.textLabel?.textColor = Theme.current.tableViewTextColor
		cell.textLabel?.lineBreakMode = .byWordWrapping
		cell.textLabel?.numberOfLines = 0

		return cell
	}

	var codeCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = NSLocalizedString(
			"Tiime on GitHub",
			comment: "Title for GitHub link cell on About Screen"
		)

		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = NSLocalizedString(
			"aboutScreenGitHubLinkDescription",
			comment: "Description text for the link to Tiime's GitHub page"
		)

		cell.detailTextLabel?.lineBreakMode = .byWordWrapping
		cell.detailTextLabel?.numberOfLines = 0
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	var hisaacTwitterCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "@hisaac"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = NSLocalizedString(
			"Follow the developer on Twitter",
			comment: "Descriptive text for the link to the developer's Twitter account"
		)
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	var isaacWebsiteCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "hisaac.net"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = NSLocalizedString(
			"Visit the developer's website",
			comment: "Descriptive text for the link to the developer's website"
		)
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	var isaacEmailCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "tiime@level.software"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = NSLocalizedString(
			"Send feedback or ideas about the app",
			comment: "Descriptive text for the link to send the developer an email"
		)
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	var thanksRyanCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "Ryan Lower"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = NSLocalizedString(
			"Designed the app's beautiful icons",
			comment: "Descriptive text for the link to Ryan Lower's Twitter profile"
		)
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

	var thanksEliCell: UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: #function)

		cell.textLabel?.text = "Eli Mellen"
		cell.textLabel?.textColor = Theme.current.appTintColor

		cell.detailTextLabel?.text = NSLocalizedString(
			"QA testing and wicked helpful app feedback",
			comment: "Descriptive text for the link to Eli Mellen's web page"
		)
		cell.detailTextLabel?.textColor = Theme.current.tableViewTextColor

		cell.accessoryType = .disclosureIndicator

		return cell
	}

}

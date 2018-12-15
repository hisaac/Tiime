// Created by Isaac Halvorson on 12/12/18

import UIKit

class SettingsListViewModel {

	// MARK: - Clock Settings Cells

	@objc var clockBackgroundColorCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = NSLocalizedString(
			"Background Color",
			comment: "The label for the Background Color cell in Settings"
		)

		let imageViewSize = CGSize(width: 30, height: 30)
		let colorImage = Theme.clockBackgroundColor.image(imageViewSize)
		cell.accessoryView = UIImageView(image: colorImage)

		return cell
	}

	@objc var clockTextColorCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = NSLocalizedString(
			"Text Color",
			comment: "The label for the Text Color cell in Settings"
		)

		let imageViewSize = CGSize(width: 30, height: 30)
		let colorImage = Theme.clockTextColor.image(imageViewSize)
		cell.accessoryView = UIImageView(image: colorImage)

		return cell
	}

	@objc var clockFontCell: UITableViewCell {
		let cell = UITableViewCell(style: .value1, reuseIdentifier: #function)
		cell.textLabel?.text = NSLocalizedString(
			"Font",
			comment: "The label for the Font cell in Settings"
		)

		cell.detailTextLabel?.attributedText = NSAttributedString(
			string: Theme.clockFont.rawValue,
			attributes: [.font: Theme.clockFont.uiFont.withSize(UIFont.systemFontSize * 1.5)]
		)

		return cell
	}

	// MARK: - App Settings Cells

	var appThemeCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = NSLocalizedString(
			"Dark Theme",
			comment: "The label for the Dark Theme cell in Settings"
		)

		let themeSwitch = UISwitch()
		themeSwitch.isOn = Theme.current == .dark
		themeSwitch.addTarget(
			nil,
			action: #selector(SettingsListViewController.toggleTheme),
			for: .valueChanged
		)

		cell.accessoryView = themeSwitch
		cell.selectionStyle = .none
		return cell
	}

	@objc var appIconCell: UITableViewCell {
		let cell = UITableViewCell(style: .value1, reuseIdentifier: #function)
		cell.textLabel?.text = NSLocalizedString(
			"App Icon",
			comment: "The label for the App Icon cell in Settings"
		)

		cell.accessoryView = UIImageView(image: Theme.appIcon.image)
		cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
		cell.accessoryView?.layer.cornerRadius = 6
		cell.accessoryView?.clipsToBounds = true

		return cell
	}

	// MARK: - More Info Cells

	@objc var aboutCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.accessoryType = .disclosureIndicator
		cell.textLabel?.text = NSLocalizedString(
			"About",
			comment: "The label for the About cell in Settings"
		)

		return cell
	}

}

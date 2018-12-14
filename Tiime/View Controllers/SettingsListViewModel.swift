// Created by Isaac Halvorson on 12/12/18

import UIKit

class SettingsListViewModel {

	weak var delegate: UITableViewController?

	// MARK: - Clock Settings Cells

	@objc var clockBackgroundColorCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Background Color"

		let imageViewSize = CGSize(width: 30, height: 30)
		let colorImage = Theme.clockBackgroundColor.image(imageViewSize)
		cell.accessoryView = UIImageView(image: colorImage)

		return cell
	}

	@objc var clockTextColorCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Text Color"

		let imageViewSize = CGSize(width: 30, height: 30)
		let colorImage = Theme.clockTextColor.image(imageViewSize)
		cell.accessoryView = UIImageView(image: colorImage)

		return cell
	}

	@objc var clockFontCell: UITableViewCell {
		let cell = UITableViewCell(style: .value1, reuseIdentifier: #function)
		cell.textLabel?.text = "Font"

		cell.detailTextLabel?.attributedText = NSAttributedString(
			string: Theme.clockFont.rawValue,
			attributes: [.font: Theme.clockFont.uiFont.withSize(UIFont.systemFontSize * 1.5)]
		)

		return cell
	}

	// MARK: - App Settings Cells

	var appThemeCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Dark Theme"

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

	var appIconCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "App Icon"
		return cell
	}

	// MARK: - More Info Cells

	var creditsCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Credits"
		return cell
	}

	var appInfoCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "App Info"
		return cell
	}

	var codeCell: UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Code"
		return cell
	}

}

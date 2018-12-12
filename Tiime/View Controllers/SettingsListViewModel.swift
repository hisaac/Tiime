// Created by Isaac Halvorson on 12/12/18

import UIKit

class SettingsListViewModel {

	weak var delegate: UITableViewController?

	// MARK: - Clock Settings Cells

	let clockBackgroundColorCell: UITableViewCell = {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Background Color"
		return cell
	}()

	let clockTextColorCell: UITableViewCell = {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Text Color"
		return cell
	}()

	let clockFontCell: UITableViewCell = {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Font"
		return cell
	}()

	// MARK: - App Settings Cells

	let appIconCell: UITableViewCell = {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Icon"
		return cell
	}()

	let appThemeCell: UITableViewCell = {
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
	}()

	// MARK: - More Info Cells

	let creditsCell: UITableViewCell = {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Credits"
		return cell
	}()

	let appInfoCell: UITableViewCell = {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "App Info"
		return cell
	}()

	let codeCell: UITableViewCell = {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)
		cell.textLabel?.text = "Code"
		return cell
	}()

}

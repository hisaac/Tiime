// Created by Isaac Halvorson on 9/24/18

import UIKit

class SettingsListViewController: UITableViewController {

	var sections: [TableViewSection] = []
	let viewModel = SettingsListViewModel()

	convenience init() {
		self.init(style: .grouped)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = NSLocalizedString("Settings", comment: "Title for the Settings screen")

		navigationItem.largeTitleDisplayMode = .always

		navigationItem.leftBarButtonItem = UIBarButtonItem(
			barButtonSystemItem: .done,
			target: self,
			action: #selector(dismissSettings)
		)

		tableView.allowsSelection = true
		setupSections()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupSections()
		tableView.reloadData()
	}

	func setupSections() {
		let clockStyleSection = TableViewSection(
			header: NSLocalizedString(
				"⏰ Clock Style",
				comment: "The header title for the Clock Style section in Settings"
			),
			cells: [
				viewModel.clockBackgroundColorCell,
				viewModel.clockTextColorCell,
				viewModel.clockFontCell
			]
		)

		let appStyleSection = TableViewSection(
			header: NSLocalizedString(
				"📱 App Style",
				comment: "The header title for the App Style section in Settings"
			),
			cells: [
				viewModel.appThemeCell,
				viewModel.appIconCell
			]
		)

		let moreInfoSection = TableViewSection(
			header: NSLocalizedString(
				"ℹ️ More Info",
				comment: "The header title for the More Info section in Settings"
			),
			cells: [
				viewModel.aboutCell
			]
		)

		sections = [clockStyleSection, appStyleSection, moreInfoSection]
	}

	@objc func dismissSettings() {
		dismiss(animated: true, completion: nil)
	}

	@objc func toggleTheme() {
		Theme.toggleCurrentTheme()
		tableView.reloadData()
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].cells.count
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sections[section].header
	}

	override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		if section == sections.count - 1 {
			let versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
			let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
			return "Version \(versionNumber) (build \(buildNumber))"
		} else {
			return sections[section].footer
		}
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = sections[indexPath.section].cells[indexPath.row]
		cell.textLabel?.textColor = Theme.current.tableViewTextColor
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		let cell = sections[indexPath.section].cells[indexPath.row]

		switch cell.reuseIdentifier {
		case #keyPath(SettingsListViewModel.clockBackgroundColorCell):
			let colorPickerView = ThemeColorPickerView(colorToSet: .backgroundColor)
			navigationController?.pushViewController(colorPickerView, animated: true)
		case #keyPath(SettingsListViewModel.clockTextColorCell):
			let colorPickerView = ThemeColorPickerView(colorToSet: .textColor)
			navigationController?.pushViewController(colorPickerView, animated: true)
		case #keyPath(SettingsListViewModel.clockFontCell):
			navigationController?.pushViewController(ThemeFontPickerView(), animated: true)
		case #keyPath(SettingsListViewModel.appIconCell):
			navigationController?.pushViewController(ThemeIconPickerView(), animated: true)
		case #keyPath(SettingsListViewModel.aboutCell):
			navigationController?.pushViewController(AboutViewController(), animated: true)
		default:
			return
		}
	}

}

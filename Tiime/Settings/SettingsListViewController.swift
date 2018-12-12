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

		viewModel.delegate = self

		navigationItem.largeTitleDisplayMode = .always

		navigationItem.leftBarButtonItem = UIBarButtonItem(
			barButtonSystemItem: .done,
			target: self,
			action: #selector(dismissSettings)
		)

		tableView.allowsSelection = true
		setupSections()
	}

	func setupSections() {
		let clockStyleSection = TableViewSection(
			header: "⏰ Clock Style",
			cells: [
				viewModel.clockBackgroundColorCell,
				viewModel.clockTextColorCell,
				viewModel.clockFontCell
			]
		)

		let appStyleSection = TableViewSection(
			header: "📱 App Style",
			cells: [
				viewModel.appIconCell,
				viewModel.appThemeCell
			]
		)

		let moreInfoSection = TableViewSection(
			header: "ℹ️ More Info",
			cells: [
				viewModel.creditsCell,
				viewModel.appInfoCell,
				viewModel.codeCell
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

}

// Created by Isaac Halvorson on 9/24/18

import UIKit

class SettingsViewController: UITableViewController {

	typealias TableViewSection = (title: String, cells: [String])

	var sections: [TableViewSection] = []

	convenience init() {
		self.init(style: .grouped)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = L10n.settings

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
			title: "Clock Style",
			cells: [
				"Background Color",
				"Text Color",
				"Font"
			]
		)

		let appStyleSection = TableViewSection(
			title: "App Style",
			cells: [
				"Icon",
				"Dark Theme"
			]
		)

		let moreInfoSection = TableViewSection(
			title: "More Info",
			cells: [
				"Credits",
				"App Info",
				"Code"
			]
		)

		sections = [clockStyleSection, appStyleSection, moreInfoSection]
	}

	@objc func dismissSettings() {
		dismiss(animated: true, completion: nil)
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].cells.count
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sections[section].title
	}

	override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		if section == sections.count - 1 {
			let versionNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
			let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
			return "App Version: \(versionNumber) (\(buildNumber))"
		} else {
			return nil
		}
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
		cell.textLabel?.text = sections[indexPath.section].cells[indexPath.row]
		return cell
	}

}

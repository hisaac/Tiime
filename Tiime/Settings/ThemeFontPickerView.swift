// Created by Isaac Halvorson on 12/13/18

import UIKit

class ThemeFontPickerView: UITableViewController {

	convenience init() {
		self.init(style: .grouped)
		title = "Clock Font"
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ThemeFont.allCases.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let font = ThemeFont.allCases[indexPath.row]
		let cell = UITableViewCell(style: .default, reuseIdentifier: font.fontName)

		cell.textLabel?.textColor = Theme.current.tableViewTextColor
		cell.accessoryType = font == Theme.clockFont ? .checkmark : .none

		cell.textLabel?.attributedText = NSAttributedString(
			string: font.rawValue,
			attributes: [.font: font.uiFont.withSize((UIFont.systemFontSize * 1.5))]
		)

		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		Theme.clockFont = ThemeFont.allCases[indexPath.row]
		tableView.reloadData()
		navigationController?.popViewController(animated: true)
	}

}

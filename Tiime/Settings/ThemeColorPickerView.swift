// Created by Isaac Halvorson on 12/12/18

import UIKit

class ThemeColorPickerView: UITableViewController {

	convenience init() {
		self.init(style: .grouped)
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ThemeColor.allCases.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let color = ThemeColor.allCases[indexPath.row]
		let cell = UITableViewCell(style: .default, reuseIdentifier: color.name)
		cell.textLabel?.text = color.name
		cell.textLabel?.textColor = Theme.current.tableViewTextColor
		cell.accessoryType = .checkmark

		let imageViewSize = CGSize(width: 30, height: 30)
		cell.imageView?.image = color.rawValue.image(imageViewSize)

		return cell
	}
}

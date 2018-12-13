// Created by Isaac Halvorson on 12/12/18

import UIKit

enum ThemeColorValue {
	case backgroundColor
	case textColor
}

class ThemeColorPickerView: UITableViewController {

	let colorToSet: ThemeColorValue

	init(colorToSet: ThemeColorValue) {
		self.colorToSet = colorToSet
		super.init(style: .grouped)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ThemeColor.allCases.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let color = ThemeColor.allCases[indexPath.row]
		let cell = UITableViewCell(style: .default, reuseIdentifier: color.name)
		
		cell.textLabel?.text = color.name
		cell.textLabel?.textColor = Theme.current.tableViewTextColor

		let imageViewSize = CGSize(width: 30, height: 30)
		cell.imageView?.image = color.rawValue.image(imageViewSize)

		switch colorToSet {
		case .backgroundColor:
			cell.accessoryType = color.rawValue == Theme.clockBackgroundColor ? .checkmark : .none
		case .textColor:
			cell.accessoryType = color.rawValue == Theme.clockTextColor ? .checkmark : .none
		}

		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let color = ThemeColor.allCases[indexPath.row]

		switch colorToSet {
		case .backgroundColor:
			Theme.clockBackgroundColor = color.rawValue
		case .textColor:
			Theme.clockTextColor = color.rawValue
		}

		tableView.reloadData()
		navigationController?.popViewController(animated: true)
	}
}

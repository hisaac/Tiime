// Created by Isaac Halvorson on 10/5/18

import UIKit

class SettingsViewController: UITableViewController {

	var data: [UIColor] = []

	convenience init() {
		self.init(style: .plain)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		data = [
			ColorName.pink,
			ColorName.red,
			ColorName.maroon,
			ColorName.darkPurple,
			ColorName.brown,
			ColorName.orange,
			ColorName.gold,
			ColorName.yellow,
			ColorName.lime,
			ColorName.green,
			ColorName.teal,
			ColorName.blue,
			ColorName.purple,
			ColorName.white,
			ColorName.lightGray,
			ColorName.midGray,
			ColorName.darkGray
		]
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: "")
		cell.backgroundColor = data[indexPath.row]
		return cell
	}

}

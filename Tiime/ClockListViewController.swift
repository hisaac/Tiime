//
// ClockListViewController.swift
// Created by Isaac Halvorson on 5/6/18
//

import UIKit

class ClockListViewController: NiblessTableViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		title = NSLocalizedString("Clocks", comment: "Title bar for main clocks list")
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ClockTypeCell")
		tableView.allowsSelection = true
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ClockType.arrayed.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ClockTypeCell")

		// TODO: Use CaseIterable once Swift 4.2 is released
		cell.textLabel?.text = ClockType.arrayed[indexPath.row].name
		cell.detailTextLabel?.text = ClockType.arrayed[indexPath.row].description
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let clockType = ClockType.arrayed[indexPath.row]
		let clockViewController = ClockViewController(timeType: clockType.timeRepresentable)

		let detailNavigationController = DetailNavigationController(rootViewController: clockViewController)
//		showDetailViewController(detailNavigationController, sender: self)
		navigationController?.pushViewController(detailNavigationController, animated: true)
	}
}

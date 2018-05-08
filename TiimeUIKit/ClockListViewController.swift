//
// ClockListViewController.swift
// Created by Isaac Halvorson on 5/6/18
//

import UIKit
import TiimeKit

public class ClockListViewController: NiblessTableViewController {
	public override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ClockTypeCell")
	}

	public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ClockType.arrayed.count
	}

	public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ClockTypeCell", for: indexPath)
		let clockName = ClockType.arrayed[indexPath.row].name
		cell.textLabel?.text = clockName
		return cell
	}
}

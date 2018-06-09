//
// MainNavigationController.swift
// Created by Isaac Halvorson on 6/8/18
//

import UIKit

class MainNavigationController: UINavigationController {
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationBar.prefersLargeTitles = true

		pushViewController(
			ClockListViewController(style: .grouped),
			animated: false
		)
	}
}

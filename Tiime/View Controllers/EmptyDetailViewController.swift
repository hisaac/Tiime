// Created by Isaac Halvorson on 6/9/18

import UIKit

class EmptyDetailViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		title = NSLocalizedString("Tiime", comment: "The name of the app")
		navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
		navigationItem.leftItemsSupplementBackButton = true
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		view.backgroundColor = Theme.DefaultValues.clockBackgroundColor

		let emptyDetailLabel = UILabel()
		emptyDetailLabel.translatesAutoresizingMaskIntoConstraints = false
		emptyDetailLabel.text = "⏰"
		emptyDetailLabel.textAlignment = .center
		emptyDetailLabel.font = UIFont.systemFont(ofSize: 48)
		emptyDetailLabel.adjustsFontForContentSizeCategory = true
		view.addSubview(emptyDetailLabel)

		emptyDetailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		emptyDetailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
}

//
//  ClockViewController.swift
//  Tiime
//
//  Created by Isaac Halvorson on 4/15/18.
//  Copyright © 2018 Levelsoft. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {

	let beatTimeLabel = UILabel()
	let unixTimeLabel = UILabel()
	let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)

	override func viewDidLoad() {
		super.viewDidLoad()

		timer.schedule(deadline: .now(), repeating: .nanoseconds(1))
		timer.setEventHandler { self.updateTimers() }
		timer.resume()

		view.backgroundColor = .white
	}

	func updateTimers() {
		beatTimeLabel.text = Date().beatTimeForDisplay
		unixTimeLabel.text = String(CFAbsoluteTimeGetCurrent().unixTime)
	}

	convenience init() {
		self.init(nibName: nil, bundle: nil)
		postInit()
	}

	func postInit() {
		beatTimeLabel.translatesAutoresizingMaskIntoConstraints = false
		beatTimeLabel.textAlignment = .center
		beatTimeLabel.font = UIFont(name: "Courier", size: 100)
		beatTimeLabel.adjustsFontSizeToFitWidth = true

		unixTimeLabel.translatesAutoresizingMaskIntoConstraints = false
		unixTimeLabel.textAlignment = .center
		unixTimeLabel.font = UIFont(name: "Courier", size: 100)
		unixTimeLabel.adjustsFontSizeToFitWidth = true

		let stackView = UIStackView(arrangedSubviews: [beatTimeLabel, unixTimeLabel])
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.distribution = .fillProportionally
		view.addSubview(stackView)

		stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
		stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16).isActive = true
		stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
	}
}

extension CFAbsoluteTime {
	var unixTime: Int {
		return Int((self + 978307200).rounded())
	}
}

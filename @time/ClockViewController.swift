//
//  ClockViewController.swift
//  @time
//
//  Created by Isaac Halvorson on 4/15/18.
//  Copyright © 2018 Levelsoft. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {

	let beatTimeLabel = UILabel()
	let unixTimeLabel = UILabel()
//	let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("updateTime"), repeats: true)
	let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)

	override func viewDidLoad() {
		super.viewDidLoad()
		timer.schedule(deadline: .now(), repeating: .milliseconds(75))
		timer.setEventHandler {
			self.beatTimeLabel.text = "@\(Date().beatTime)"
			self.unixTimeLabel.text = "\(Date().unixTime)"
		}
		timer.resume()
		view.backgroundColor = .white
	}

	convenience init() {
		self.init(nibName: nil, bundle: nil)
		postInit()
	}

	@objc func updateTime() {
		beatTimeLabel.text = "@\(Date().beatTime)"
		unixTimeLabel.text = "\(Date().unixTime)"
	}

	func postInit() {
		beatTimeLabel.translatesAutoresizingMaskIntoConstraints = false
		beatTimeLabel.textAlignment = .center
		beatTimeLabel.font = UIFont.systemFont(ofSize: 100)
		beatTimeLabel.adjustsFontSizeToFitWidth = true

		unixTimeLabel.translatesAutoresizingMaskIntoConstraints = false
		unixTimeLabel.textAlignment = .center
		unixTimeLabel.font = UIFont.systemFont(ofSize: 100)
		unixTimeLabel.adjustsFontSizeToFitWidth = true

		let stackView = UIStackView(arrangedSubviews: [beatTimeLabel, unixTimeLabel])
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.distribution = .fillProportionally
		view.addSubview(stackView)

//		stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//		stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
		stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16).isActive = true
		stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
	}
}

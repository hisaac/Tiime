// Created by Isaac Halvorson on 4/15/18

import UIKit

class ClockViewController: NiblessViewController {
	let timeLabel = UILabel()
	let timeType: TimeRepresentable

	init(timeType: TimeRepresentable) {
		self.timeType = timeType
		super.init()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = timeType.timeTypeTitle
		view.backgroundColor = .white
		navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
		navigationItem.leftItemsSupplementBackButton = true

		createDisplayLink()
	}

	func createDisplayLink() {
		let displayLink = CADisplayLink(target: self, selector: #selector(updateClockDisplay))
		displayLink.add(to: .current, forMode: RunLoop.Mode.default)
	}

	@objc func updateClockDisplay() {
		timeLabel.text = timeType.timeForDisplay
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		timeLabel.translatesAutoresizingMaskIntoConstraints = false
		timeLabel.textAlignment = .center
		timeLabel.baselineAdjustment = .alignCenters
		timeLabel.numberOfLines = 1
		timeLabel.adjustsFontSizeToFitWidth = true
		timeLabel.adjustsFontForContentSizeCategory = true
		let font = UIFont(name: "iAWriterDuospace-Regular", size: 500) ?? UIFont.systemFont(ofSize: 500)
		timeLabel.font = UIFontMetrics.default.scaledFont(for: font)
		view.addSubview(timeLabel)

		let guide = view.layoutMarginsGuide
		NSLayoutConstraint.activate([
			timeLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
			timeLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
			timeLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
			timeLabel.centerYAnchor.constraint(equalTo: guide.centerYAnchor)
		])
	}
}

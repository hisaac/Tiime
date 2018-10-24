// Created by Isaac Halvorson on 4/15/18

import UIKit

class ClockViewController: UIViewController {

	let timeLabel = UILabel()
	let timeType: TimeRepresentable

	init(timeType: TimeRepresentable) {
		self.timeType = timeType
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		timeType = ClockType.device.timeRepresentable
		super.init(nibName: nil, bundle: nil)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = timeType.timeTypeTitle
		view.backgroundColor = .white
		navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
		navigationItem.leftItemsSupplementBackButton = true

		createDisplayLink()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}

	func createDisplayLink() {
		let displayLink = CADisplayLink(target: self, selector: #selector(updateClockDisplay))
		displayLink.add(to: .current, forMode: RunLoop.Mode.default)
	}

	@objc func updateClockDisplay() {
		timeLabel.text = timeType.timeForDisplay
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		timeLabel.translatesAutoresizingMaskIntoConstraints = false
		timeLabel.textAlignment = .center
		timeLabel.baselineAdjustment = .alignCenters
		timeLabel.numberOfLines = 1
		timeLabel.adjustsFontSizeToFitWidth = true
		timeLabel.adjustsFontForContentSizeCategory = true
//		timeLabel.font = UIFontMetrics.default.scaledFont(for: Theme.clockFont.uiFont(ofSize: 500))
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

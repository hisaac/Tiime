//
// ClockViewController.swift
// Created by Isaac Halvorson on 4/15/18
//

import UIKit
import RxCocoa
import RxSwift

public class ClockViewController: NiblessViewController {

	let timeLabel = UILabel()
	let timeType: TimeRepresentable
	let timer = Observable<Int>.interval(0.01, scheduler: MainScheduler.instance)
	let disposeBag = DisposeBag()

	// Add support for upside down orientation
	override public var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .all }

	public init(timeType: TimeRepresentable) {
		self.timeType = timeType
		super.init()
	}

	override public func viewDidLoad() {
		super.viewDidLoad()
		title = timeType.timeTypeTitle
		view.backgroundColor = .white

		timer.map({ _ in self.timeType.timeForDisplay })
			.bind(to: timeLabel.rx.text)
			.disposed(by: disposeBag)
	}

	override public func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		timeLabel.translatesAutoresizingMaskIntoConstraints = false
		timeLabel.textAlignment = .center
		timeLabel.baselineAdjustment = .alignCenters
		timeLabel.numberOfLines = 1
		timeLabel.minimumScaleFactor = 0.1
		timeLabel.adjustsFontSizeToFitWidth = true
		timeLabel.adjustsFontForContentSizeCategory = true
		let font = UIFont(name: "iAWriterDuospace-Regular", size: 500) ?? UIFont.systemFont(ofSize: 500)
		timeLabel.font = UIFontMetrics.default.scaledFont(for: font)

		view.addSubview(timeLabel)

		let guide = view.layoutMarginsGuide
		timeLabel.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
		timeLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
		timeLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
		timeLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
		timeLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
		timeLabel.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
	}
}

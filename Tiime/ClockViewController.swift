//
// ClockViewController.swift
// Created by Isaac Halvorson on 4/15/18
//

import UIKit
import RxCocoa
import RxSwift

class ClockViewController: NiblessViewController {
	let timeLabel = UILabel()
	let timeType: TimeRepresentable
	let timer = Observable<Int>.interval(0.01, scheduler: MainScheduler.instance)
	let disposeBag = DisposeBag()

	init(timeType: TimeRepresentable) {
		self.timeType = timeType
		super.init()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = timeType.timeTypeTitle
		view.backgroundColor = .white
		navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .never
		navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
		navigationItem.leftItemsSupplementBackButton = true

		timer.map({ _ in self.timeType.timeForDisplay })
			.bind(to: timeLabel.rx.text)
			.disposed(by: disposeBag)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
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

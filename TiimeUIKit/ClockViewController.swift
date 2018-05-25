//
// ClockViewController.swift
// Created by Isaac Halvorson on 4/15/18
//

import UIKit
import TiimeKit
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
		buildLayout()

		timer.map({ _ in self.timeType.timeForDisplay })
			.bind(to: timeLabel.rx.text)
			.disposed(by: disposeBag)

		title = NSLocalizedString(".beat Time", comment: "")
		view.backgroundColor = .white
	}

	private func buildLayout() {
		timeLabel.translatesAutoresizingMaskIntoConstraints = false
		timeLabel.textAlignment = .center
		timeLabel.font = UIFont(name: "Courier", size: 50)
		timeLabel.adjustsFontSizeToFitWidth = true
		view.addSubview(timeLabel)

		let guide = view.safeAreaLayoutGuide
		timeLabel.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
		timeLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
		timeLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
		timeLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
		timeLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
		timeLabel.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
	}
}

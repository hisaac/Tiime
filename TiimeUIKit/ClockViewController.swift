//
//  ClockViewController.swift
//  Tiime
//
//  Created by Isaac Halvorson on 4/15/18.
//  Copyright © 2018 Levelsoft. All rights reserved.
//

import UIKit
import TiimeKit
import RxCocoa
import RxSwift

public class ClockViewController: UIViewController {

	let timeLabel = UILabel()
	let timeType: TimeRespresentable
	let timer = Observable<Int>.interval(0.01, scheduler: MainScheduler.instance)
	let disposeBag = DisposeBag()

	// Add support for upside down orientation
	override public var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .all }

	override public init(nibName: String?, bundle: Bundle?) {
		timeType = BeatTime()
		super.init(nibName: nibName, bundle: bundle)
		_init()
	}

	required public init?(coder aDecoder: NSCoder) {
		timeType = BeatTime()
		super.init(coder: aDecoder)
		_init()
	}

	public init(timeType: TimeRespresentable = BeatTime()) {
		self.timeType = timeType
		super.init(nibName: nil, bundle: nil)
		_init()
	}

	func _init() {
		buildLayout()
	}

	override public func viewDidLoad() {
		super.viewDidLoad()

		timer.map({ _ in self.timeType.timeForDisplay })
			.bind(to: timeLabel.rx.text)
			.disposed(by: disposeBag)
	}

	func buildLayout() {
		view.backgroundColor = .white

		timeLabel.translatesAutoresizingMaskIntoConstraints = false
		timeLabel.textAlignment = .center
		timeLabel.font = UIFont(name: "Courier", size: 50)
		timeLabel.adjustsFontSizeToFitWidth = true

		let stackView = UIStackView(arrangedSubviews: [timeLabel])
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.distribution = .fillProportionally
		view.addSubview(stackView)

		let guide = view.safeAreaLayoutGuide
		stackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16).isActive = true
		stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -16).isActive = true
		stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16).isActive = true
		stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16).isActive = true
	}
}

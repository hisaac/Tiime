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
		buildLayout()
	}

	override public func viewDidLoad() {
		super.viewDidLoad()

		timer.map({ _ in self.timeType.timeForDisplay })
			.bind(to: timeLabel.rx.text)
			.disposed(by: disposeBag)
	}

	private func buildLayout() {
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

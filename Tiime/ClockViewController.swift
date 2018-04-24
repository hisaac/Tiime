//
//  ClockViewController.swift
//  Tiime
//
//  Created by Isaac Halvorson on 4/15/18.
//  Copyright © 2018 Levelsoft. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ClockViewController: UIViewController {

	let beatTimeLabel = UILabel()
	let unixTimeLabel = UILabel()
	let timer = Observable<Int>.interval(0.01, scheduler: MainScheduler.instance)
	let disposeBag = DisposeBag()

	// Add support for upside down orientation
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .all }

	override func viewDidLoad() {
		super.viewDidLoad()


		timer.map({ _ in Date().beatTimeForDisplay })
			.bind(to: beatTimeLabel.rx.text)
			.disposed(by: disposeBag)

		timer.map({ _ in String(CFAbsoluteTimeGetCurrent().unixTime) })
			.bind(to: unixTimeLabel.rx.text)
			.disposed(by: disposeBag)

		view.backgroundColor = .white
	}

	convenience init() {
		self.init(nibName: nil, bundle: nil)
		postInit()
	}

	func postInit() {
		beatTimeLabel.translatesAutoresizingMaskIntoConstraints = false
		beatTimeLabel.textAlignment = .center
		beatTimeLabel.font = UIFont(name: "Courier", size: 50)
		beatTimeLabel.adjustsFontSizeToFitWidth = true

		unixTimeLabel.translatesAutoresizingMaskIntoConstraints = false
		unixTimeLabel.textAlignment = .center
		unixTimeLabel.font = UIFont(name: "Courier", size: 50)
		unixTimeLabel.adjustsFontSizeToFitWidth = true

		let stackView = UIStackView(arrangedSubviews: [beatTimeLabel, unixTimeLabel])
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

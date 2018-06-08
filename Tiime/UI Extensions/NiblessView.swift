//
// NiblessView.swift
// Created by Isaac Halvorson on 4/26/18
//

import UIKit

class NiblessView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	@available(*, unavailable, message: "Loading this view from a nib is unsupported.")
	required init?(coder aDecoder: NSCoder) {
		fatalError("Loading this view from a nib is unsupported.")
	}
}

//
// NiblessTableViewController.swift
// Created by Isaac Halvorson on 5/6/18
//

import UIKit

class NiblessTableViewController: UITableViewController {
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	override init(style: UITableViewStyle) {
		super.init(style: style)
	}

	@available(*, unavailable, message: "Loading this view controller from a nib is unsupported.")
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

	@available(*, unavailable, message: "Loading this view controller from a nib is unsupported.")
	required init?(coder aDecoder: NSCoder) {
		fatalError("Loading this view controller from a nib is unsupported.")
	}
}


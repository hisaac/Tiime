//
// Created by Isaac Halvorson on 5/6/18.
// Copyright (c) 2018 Levelsoft. All rights reserved.
//

public class NiblessTableViewController: UITableViewController {
	public init() {
		super.init(nibName: nil, bundle: nil)
	}

	// swiftlint:disable:next line_length
	@available(*, unavailable, message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
	public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

	// swiftlint:disable:next line_length
	@available(*, unavailable, message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
	public required init?(coder aDecoder: NSCoder) {
		fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
	}
}


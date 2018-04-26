//
//  NiblessViewController.swift
//  TiimeUIKit
//
//  Created by Isaac Halvorson on 4/26/18.
//  Copyright © 2018 Levelsoft. All rights reserved.
//

public class NiblessViewController: UIViewController {
	public init() {
		super.init(nibName: nil, bundle: nil)
	}

	@available(*, unavailable,
	message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
	)
	public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

	@available(*, unavailable,
	message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
	)
	public required init?(coder aDecoder: NSCoder) {
		fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
	}
}

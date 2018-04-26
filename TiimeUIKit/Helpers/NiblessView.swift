//
//  NiblessView.swift
//  TiimeUIKit
//
//  Created by Isaac Halvorson on 4/26/18.
//  Copyright © 2018 Levelsoft. All rights reserved.
//

public class NiblessView: UIView {
	public override init(frame: CGRect) {
		super.init(frame: frame)
	}

	@available(*, unavailable,
	message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
	)
	public required init?(coder aDecoder: NSCoder) {
		fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
	}
}

//
// NiblessView.swift
// Created by Isaac Halvorson on 4/26/18
//

public class NiblessView: UIView {
	public override init(frame: CGRect) {
		super.init(frame: frame)
	}

	@available(*, unavailable, message: "Loading this view from a nib is unsupported.")
	public required init?(coder aDecoder: NSCoder) {
		fatalError("Loading this view from a nib is unsupported.")
	}
}

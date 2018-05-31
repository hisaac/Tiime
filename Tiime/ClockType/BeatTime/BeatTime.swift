//
// BeatTime.swift
// Created by Isaac Halvorson on 4/24/18
//

import Foundation

public struct BeatTime: TimeRepresentable {
	public init() {}
	public var timeForDisplay: String {
		return Date().beatTimeForDisplay
	}

	public var timeTypeTitle: String {
		return ClockType.beat.name
	}
}

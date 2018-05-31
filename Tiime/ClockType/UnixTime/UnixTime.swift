//
// UnixTime.swift
// Created by Isaac Halvorson on 5/25/18
//

import Foundation

public struct UnixTime: TimeRepresentable {
	public init() {}
	public var timeForDisplay: String {
		return Date().unixTimeForDisplay
	}

	public var timeTypeTitle: String {
		return ClockType.unix.name
	}
}

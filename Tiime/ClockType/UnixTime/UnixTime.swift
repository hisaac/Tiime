//
// UnixTime.swift
// Created by Isaac Halvorson on 5/25/18
//

import Foundation

struct UnixTime: TimeRepresentable {
	var timeForDisplay: String {
		return Date().unixTimeForDisplay
	}

	var timeTypeTitle: String {
		return ClockType.unix.name
	}
}

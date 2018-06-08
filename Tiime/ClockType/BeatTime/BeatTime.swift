//
// BeatTime.swift
// Created by Isaac Halvorson on 4/24/18
//

import Foundation

struct BeatTime: TimeRepresentable {
	var timeForDisplay: String {
		return Date().beatTimeForDisplay
	}

	var timeTypeTitle: String {
		return ClockType.beat.name
	}
}

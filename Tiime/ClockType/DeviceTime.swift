//
// DeviceTime.swift
// Created by Isaac Halvorson on 5/25/18
//

import Foundation

struct DeviceTime: TimeRepresentable {
	var timeForDisplay: String {
		return DateFormatter.localizedString(
			from: Date(),
			dateStyle: .none,
			timeStyle: .medium
		)
	}

	var timeTypeTitle: String {
		return ClockType.device.name
	}
}

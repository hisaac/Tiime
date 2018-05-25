//
// DeviceTime.swift
// Created by Isaac Halvorson on 5/25/18
//

import Foundation

public struct DeviceTime: TimeRepresentable {
	public init() {}
	public var timeForDisplay: String {
		return DateFormatter.localizedString(
			from: Date(),
			dateStyle: .none,
			timeStyle: .medium
		)
	}

	public var timeTypeTitle: String {
		return ClockType.device.name
	}
}

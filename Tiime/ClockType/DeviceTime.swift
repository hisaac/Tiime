// Created by Isaac Halvorson on 5/25/18

import Foundation

enum DeviceTime: TimeRepresentable {
	static var timeForDisplay: String {
		return DateFormatter.localizedString(
			from: Date(),
			dateStyle: .none,
			timeStyle: .medium
		)
	}

	static var name: String {
		return NSLocalizedString("Device Time", comment: "Name of Device Time")
	}

	static var description: String {
		return NSLocalizedString(
			"The time displayed in the default way for the device's locale",
			comment: "Description for Device Time"
		)
	}
}

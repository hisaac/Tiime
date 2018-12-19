// Created by Isaac Halvorson on 12/19/18

import Foundation

struct HexidecimalTime: TimeRepresentable {
	var timeForDisplay: String {
		return ".\(Date().hexidecimalTime)"
	}

	var name: String {
		return NSLocalizedString("Hexidecimal Time", comment: "Name of Hexidecimal Time")
	}

	#warning("TODO: Add Hexidecimal Description")
	var description: String {
		return NSLocalizedString(
			"HexidecimalTimeDescription",
			comment: "Description for Hexidecimal Time"
		)
	}
}

extension Date {

	/// Returns the hexidecimal representation of the given date
	var hexidecimalTime: String {
		let startOfDay = Calendar.autoupdatingCurrent.startOfDay(for: self)
		let seconds = timeIntervalSince(startOfDay)

		let secondsInAHexidecimalSecond = 1.318_359_375
		let hexidecimalSeconds = seconds / secondsInAHexidecimalSecond

		return String(format: "%X", Int(hexidecimalSeconds))
	}
}

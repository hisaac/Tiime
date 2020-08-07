// Created by Isaac Halvorson on 12/19/18

import Foundation

enum HexadecimalTime: TimeRepresentable {
	static var timeForDisplay: String {
		return ".\(Date().hexadecimalTime)"
	}

	static var name: String {
		return NSLocalizedString("Hexadecimal Time", comment: "Name of Hexadecimal Time")
	}

	static var description: String {
		return NSLocalizedString(
			"HexadecimalTimeDescription",
			comment: "Description for Hexadecimal Time"
		)
	}
}

extension Date {

	/// Returns the hexadecimal representation of the given date
	var hexadecimalTime: String {
		let startOfDay = Calendar.autoupdatingCurrent.startOfDay(for: self)
		let seconds = timeIntervalSince(startOfDay)

		let secondsInAHexadecimalSecond = 1.318_359_375
		let hexadecimalSeconds = seconds / secondsInAHexadecimalSecond

		return String(format: "%X", Int(hexadecimalSeconds))
	}
}

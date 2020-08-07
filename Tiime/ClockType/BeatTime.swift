// Created by Isaac Halvorson on 4/24/18

import Foundation

enum BeatTime: TimeRepresentable {

	/// Returns a string representation of the Beat Time, including centibeats.
	/// Meant for displaying to the user.
	///
	/// Note: This method does *not* round. When dealing with time, we don't want to round up, because
	/// it's not technically the next point in time until it *actually is* the next point in time.
	///
	static var timeForDisplay: String {
		// Create numberFormatter with minimum fraction digits
		let numberFormatter = NumberFormatter()
		numberFormatter.minimumFractionDigits = 2

		let floored = floor(Date().beatTime * 100) / 100 // Drops all digits after centibeats
		let beatTimeString = numberFormatter.string(for: floored) ?? "?"
		return "@\(beatTimeString)"
	}

	static var name: String {
		return NSLocalizedString(".beat Time", comment: "Name of .beat Time")
	}

	static var description: String {
		return NSLocalizedString(
			".beatTimeDescription",
			comment: "Description for .beat Time"
		)
	}
}

extension Date {

	/// Returns the .beat time representation of the given date
	var beatTime: Double {
		// Set the calendar's time zone to BMT (Biel Mean Time = GMT+01)
		var calendar = Calendar.autoupdatingCurrent
		guard let bmt = TimeZone(secondsFromGMT: 3_600) else { return -1 }
		calendar.timeZone = bmt

		// Get the start of day and calculate how many seconds it has been since then
		let startOfDay = calendar.startOfDay(for: self)
		let seconds = timeIntervalSince(startOfDay)

		let secondsInABeat = 86.4

		return seconds / secondsInABeat
	}
}

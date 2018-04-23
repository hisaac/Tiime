//
// Created by Isaac Halvorson on 4/23/18.
// Copyright (c) 2018 Levelsoft. All rights reserved.
//

import Foundation

extension Date {

	// Returns the .beat time representation of the given date
	var beatTime: Double {
		// Set the calendar's time zone to BMT (Biel Mean Time = GMT+01)
		var calendar = Calendar.current
		calendar.timeZone = TimeZone(secondsFromGMT: 60 * 60)!

		// Get the start of day and calculate how many seconds it has been since then
		let startOfDay = calendar.startOfDay(for: self)
		let seconds = timeIntervalSince(startOfDay)

		// There are 86.4 seconds in a beat
		let beats = seconds / 86.4
		return beats
	}
}

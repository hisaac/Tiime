//
//  DateExtensions.swift
//  @time
//
//  Created by Isaac Halvorson on 4/15/18.
//  Copyright © 2018 Levelsoft. All rights reserved.
//

import Foundation

extension Date {

	// Returns the .beat time representation of the given date
	var beatTime: Double {
		// Set the calendar time zone to BMT (a.k.a. Biel Mean Time = UTC+01)
		var calendar = Calendar.current
		calendar.timeZone = TimeZone(abbreviation: "UTC+01")!

		// Get date components
		let hours   = calendar.component(.hour,   from: self)
		let minutes = calendar.component(.minute, from: self)
		let seconds = calendar.component(.second, from: self)

		// Calculate .beat time
		let timeInSeconds = (((hours * 60) + minutes) * 60) + seconds
		let secondsInABeat = 86.4
		let beats = Double(timeInSeconds) / secondsInABeat

		// Return .beat time rounded to centibeats
		return round(beats * 100) / 100
	}

	// Returns the Unix time, rounded to the nearest whole number
	var unixTime: Int {
		return Int(round(self.timeIntervalSince1970))
	}
}

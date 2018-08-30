// Created by Isaac Halvorson on 5/25/18

import Foundation

struct UnixTime: TimeRepresentable {
	var timeForDisplay: String {
		return Date().unixTimeForDisplay
	}

	var timeTypeTitle: String {
		return ClockType.unix.name
	}
}

extension Date {
	var unixTime: Int {
		return Int(round(self.timeIntervalSince1970))
	}

	var unixTimeForDisplay: String {
		return "\(unixTime)"
	}
}

extension CFAbsoluteTime {
	var unixTime: Int {
		return Int((self + 978_307_200).rounded())
	}
}

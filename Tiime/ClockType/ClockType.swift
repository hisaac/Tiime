// Created by Isaac Halvorson on 4/24/18

import Foundation

enum ClockType: CaseIterable {

	case beat   // Swatch .beat time / Internet Time
	case device // The time displayed based on the device's setting
	case unix   // Unix time / Epoch time
	case metric // Metric Time

}

extension ClockType {

	/// The `TimeRepresentable` object associated with each clock type value
	var timeRepresentable: TimeRepresentable {
		switch self {
		case .beat:   return BeatTime()
		case .device: return DeviceTime()
		case .unix:   return UnixTime()
		case .metric: return MetricTime()
		}
	}

	/// The name of each ClockType
	var name: String {
		switch self {
		case .beat:   return NSLocalizedString(".beat Time", comment: "Name of .beat Time")
		case .device: return NSLocalizedString("Device Time", comment: "Name of Device Time")
		case .unix:   return NSLocalizedString("Unix Time", comment: "Name of Unix Time")
		case .metric: return NSLocalizedString("Metric Time", comment: "Name of Metric Time")
		}
	}

	/// The description of each ClockType
	var description: String {
		switch self {
		case .beat:
			return NSLocalizedString(
				"The day is divided into 1000 \"beats\"",
				comment: "Description for .beat Time"
			)
		case .device:
			return NSLocalizedString(
				"The time displayed in the default way for the device's locale",
				comment: "Description for Device Time"
			)
		case .unix:
			return NSLocalizedString(
				"The amount of seconds since January 1, 1970",
				comment: "Description for Unix Time"
			)
		case .metric:
			return NSLocalizedString(
				"The day is divided into units of tenths, hundredths, thousands, etc.",
				comment: "Description for Metric Time"
			)
		}
	}

}

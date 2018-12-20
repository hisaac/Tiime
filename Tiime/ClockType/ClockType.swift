// Created by Isaac Halvorson on 4/24/18

import Foundation

enum ClockType: CaseIterable {

	case beat   // Swatch .beat time / Internet Time
	case unix   // Unix time / Epoch time
	case metric // Metric Time
	case hexadecimal
	case device // The time displayed based on the device's setting

}

extension ClockType {

	/// The `TimeRepresentable` object associated with each clock type value
	var timeRepresentable: TimeRepresentable {
		switch self {
		case .beat:   return BeatTime()
		case .unix:   return UnixTime()
		case .metric: return MetricTime()
		case .hexadecimal: return HexadecimalTime()
		case .device: return DeviceTime()
		}
	}

}

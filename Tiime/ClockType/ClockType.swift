// Created by Isaac Halvorson on 4/24/18

import Foundation

enum ClockType: CaseIterable {

	/// Swatch .beat time / Internet Time
	case beat

	/// Unix time / Epoch time
	case unix

	/// Metric time
	case metric

	/// Hexadecimal time
	case hexadecimal

	/// The time displayed based on the device's setting
	case device
}

extension ClockType: RawRepresentable {

	typealias RawValue = TimeRepresentable

	init?(rawValue: RawValue) {
		switch rawValue {
		case is BeatTime:
			self = .beat
		case is UnixTime:
			self = .unix
		case is MetricTime:
			self = .metric
		case is HexadecimalTime:
			self = .hexadecimal
		case is DeviceTime:
			self = .device
		default:
			self = .device
		}
	}

	var rawValue: RawValue {
		switch self {
		case .beat:
			return BeatTime()
		case .unix:
			return UnixTime()
		case .metric:
			return MetricTime()
		case .hexadecimal:
			return HexadecimalTime()
		case .device:
			return DeviceTime()
		}
	}

}

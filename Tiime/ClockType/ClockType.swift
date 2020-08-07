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

	typealias RawValue = TimeRepresentable.Type

	init?(rawValue: RawValue) {
		switch rawValue {
		case is BeatTime.Type:
			self = .beat
		case is UnixTime.Type:
			self = .unix
		case is MetricTime.Type:
			self = .metric
		case is HexadecimalTime.Type:
			self = .hexadecimal
		case is DeviceTime.Type:
			self = .device
		default:
			self = .device
		}
	}

	var rawValue: RawValue {
		switch self {
		case .beat:
			return BeatTime.self
		case .unix:
			return UnixTime.self
		case .metric:
			return MetricTime.self
		case .hexadecimal:
			return HexadecimalTime.self
		case .device:
			return DeviceTime.self
		}
	}

}

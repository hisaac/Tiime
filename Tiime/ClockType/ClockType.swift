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
		case .beat:   return L10n.TimeType.Beat.title
		case .device: return L10n.TimeType.Device.title
		case .unix:   return L10n.TimeType.Unix.title
		case .metric: return L10n.TimeType.Metric.title
		}
	}

	/// The description of each ClockType
	var description: String {
		switch self {
		case .beat:   return L10n.TimeType.Beat.description
		case .device: return L10n.TimeType.Device.description
		case .unix:   return L10n.TimeType.Unix.description
		case .metric: return L10n.TimeType.Metric.description
		}
	}

}

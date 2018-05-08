//
// ClockType.swift
// Created by Isaac Halvorson on 4/24/18
//

// TODO: Add `CaseIterable` conformance once Swift 4.2 is released
public enum ClockType {
	case beat   // Swatch .beat time / Internet Time
	case device // The time displayed based on the device's setting
	case unix   // Unix time / Epoch time

	/// The `TimeRepresentable` object associated with each clock type value
	public var timeRepresentable: TimeRepresentable {
		// TODO: Update these with their actual values
		switch self {
		case .beat:   return BeatTime()
		case .device: return BeatTime()
		case .unix:   return BeatTime()
		}
	}

	/// The name of each ClockType
	public var name: String {
		switch self {
		case .beat:   return NSLocalizedString(".beat Time", comment: "The name of .beat Time")
		case .device: return NSLocalizedString("Device Time", comment: "The name of the device's time")
		case .unix:   return NSLocalizedString("Unix Time", comment: "The name of Unix time")
		}
	}

	/// Returns an array containing each ClockType case
	public static var arrayed: [ClockType] {
		return [.beat, .device, .unix]
	}
}

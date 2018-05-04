//
// Created by Isaac Halvorson on 4/24/18.
// Copyright (c) 2018 Levelsoft. All rights reserved.
//

public enum ClockType {
	case beat   // Swatch .beat time / Internet Time
	case device // The time displayed based on the device's setting
	case unix   // Unix time / Epoch time

	/// The `TimeRepresentable` object associated with each clock type value
	var timeRepresentable: TimeRepresentable {
		// TODO: Update these with their actual values
		switch self {
			case .beat:   return BeatTime()
			case .device: return BeatTime()
			case .unix:   return BeatTime()
		}
	}
}

//
// Created by Isaac Halvorson on 4/24/18.
// Copyright (c) 2018 Levelsoft. All rights reserved.
//

public enum ClockTypes {
	case beat   // Swatch .beat time / Internet Time
	case device // The time displayed based on the device's setting
	case unix   // Unix time / Epoch time
}

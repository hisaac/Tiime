//
// Created by Isaac Halvorson on 4/24/18.
// Copyright (c) 2018 Levelsoft. All rights reserved.
//

import Foundation

class BeatTime: TimeRespresentable {
	var timeForDisplay: String {
		return Date().beatTimeForDisplay
	}
}

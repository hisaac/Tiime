//
// Created by Isaac Halvorson on 4/24/18.
// Copyright (c) 2018 Levelsoft. All rights reserved.
//

import Foundation

public class BeatTime: TimeRepresentable {
	public init() {}
	public var timeForDisplay: String {
		return Date().beatTimeForDisplay
	}
}

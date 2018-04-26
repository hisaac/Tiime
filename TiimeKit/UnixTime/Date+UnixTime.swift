//
// Created by Isaac Halvorson on 4/23/18.
// Copyright (c) 2018 Levelsoft. All rights reserved.
//

import Foundation

extension Date {
	var unixTime: Int {
		return Int(round(self.timeIntervalSince1970))
	}
}

//
// Created by Isaac Halvorson on 4/23/18.
// Copyright (c) 2018 Levelsoft. All rights reserved.
//

import Foundation

extension CFAbsoluteTime {
	var unixTime: Int {
		return Int((self + 978307200).rounded())
	}
}

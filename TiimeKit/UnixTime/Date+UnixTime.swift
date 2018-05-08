//
// Date+UnixTime.swift
// Created by Isaac Halvorson on 4/23/18
//

import Foundation

extension Date {
	var unixTime: Int {
		return Int(round(self.timeIntervalSince1970))
	}
}

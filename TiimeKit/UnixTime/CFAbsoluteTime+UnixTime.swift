//
// CFAbsoluteTime+UnixTime.swift
// Created by Isaac Halvorson on 4/23/18
//

import Foundation

extension CFAbsoluteTime {
	var unixTime: Int {
		return Int((self + 978307200).rounded())
	}
}

//
// BeatTime.swift
// Created by Isaac Halvorson on 4/24/18
//

import Foundation

public class BeatTime: TimeRepresentable {
	public init() {}
	public var timeForDisplay: String {
		return Date().beatTimeForDisplay
	}
}

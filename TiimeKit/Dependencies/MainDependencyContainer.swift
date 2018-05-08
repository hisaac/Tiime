//
// MainDependencyContainer.swift
// Created by Isaac Halvorson on 4/26/18
//

import Foundation

public class MainDependencyContainer: MainDependencyProvider {
	public static func makeTimeRepresentable(ofType clockType: ClockType = .device) -> TimeRepresentable {
		return clockType.timeRepresentable
	}
}

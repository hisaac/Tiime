// Created by Isaac Halvorson on 4/26/18

import Foundation

class MainDependencyContainer: MainDependencyProvider {
	static func makeTimeRepresentable(ofType clockType: ClockType = .device) -> TimeRepresentable {
		return clockType.timeRepresentable
	}
}

//
//  MainDependencyContainer.swift
//  TiimeKit
//
//  Created by Isaac Halvorson on 4/26/18.
//  Copyright © 2018 Levelsoft. All rights reserved.
//

import Foundation

public class MainDependencyContainer: MainDependencyProvider {
	public static func makeTimeRepresentable(ofType clockType: ClockType = .device) -> TimeRepresentable {
		return clockType.timeRepresentable
	}
}

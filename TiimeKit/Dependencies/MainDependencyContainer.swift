//
//  MainDependencyContainer.swift
//  TiimeKit
//
//  Created by Isaac Halvorson on 4/26/18.
//  Copyright © 2018 Levelsoft. All rights reserved.
//

import Foundation

class MainDependencyContainer: MainDependencyProvider {
	public func makeTimeRepresentable() -> TimeRepresentable {
		return BeatTime()
	}
}

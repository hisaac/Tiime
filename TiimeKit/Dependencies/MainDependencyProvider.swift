//
// MainDependencyProvider.swift
// Created by Isaac Halvorson on 4/26/18
//

import Foundation

protocol MainDependencyProvider {
	static func makeTimeRepresentable(ofType clockType: ClockType) -> TimeRepresentable
}

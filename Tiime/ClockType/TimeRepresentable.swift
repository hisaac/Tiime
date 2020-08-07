// Created by Isaac Halvorson on 4/24/18

import Foundation

protocol TimeRepresentable {
	static var timeForDisplay: String { get }
	static var name: String { get }
	static var description: String { get }
}

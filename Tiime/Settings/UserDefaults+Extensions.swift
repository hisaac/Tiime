// Created by Isaac Halvorson on 12/11/18

import UIKit

/// UserDefaults extensions for getting and setting UIColor values
/// Source: https://www.bobthedeveloper.io/blog/store-uicolor-with-userdefaults-in-swift
///
extension UserDefaults {

	/// Returns the UIColor value associated with the specified key
	func color(forKey: String) throws -> UIColor? {
		guard let colorData = data(forKey: forKey) else { return nil }
		return try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData)
	}

	/// Sets the value of the specified default key to the specified UIColor value
	func set(color: UIColor?, forKey key: String) {
		guard let color = color else {
			setNilValueForKey(key)
			return
		}

		let archivedColorData = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
		guard let colorData = archivedColorData else { return }
		set(colorData, forKey: key)
	}

}

// Created by Isaac Halvorson on 12/11/18

import UIKit

/// UserDefaults extensions for getting and setting UIColor values
/// Source: https://www.bobthedeveloper.io/blog/store-uicolor-with-userdefaults-in-swift
///
extension UserDefaults {

	/// Returns the UIColor value associated with the specified key
	func colorForKey(key: String) -> UIColor? {
		guard let colorData = data(forKey: key) else { return nil }
		return NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
	}

	/// Sets the value of the specified default key to the specified UIColor value
	func setColor(color: UIColor?, forKey key: String) {
		guard let color = color else {
			setNilValueForKey(key)
			return
		}

		let colorData = NSKeyedArchiver.archivedData(withRootObject: color)
		set(colorData, forKey: key)
	}

}

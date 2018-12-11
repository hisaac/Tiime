// Created by Isaac Halvorson on 9/20/18

import UIKit

enum Theme: Int, CaseIterable {

	case light = 0
	case dark = 1

	init(darkMode: Bool) {
		self = darkMode ? .dark : .light
	}

	enum Font: String, CaseIterable {
		case system = "Courier"
		case hack = "Hack"
		case iAWriterDuospace = "iA Writer Duospace"
		case lcd = "LCD"
	}

	/// Colors from Apple's Human Interface Guidelines
	/// reference: https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/
	///
	enum Color: String, CaseIterable {
		case red
		case orange
		case yellow
		case green
		case teal
		case blue
		case purple
		case pink

		// Grayscale
		case white
		case lightGray
		case darkGray
		case black
	}
}

// MARK: - UserDefaults Getters and Setters

extension Theme: UserDefaultsInteracting {

	private enum UserDefaultsKey {
		static let appTintColor = "appTintColor"
		static let clockBackgroundColor = "clockBackgroundColor"
		static let clockFont = "clockFont"
		static let clockTextColor = "clockTextColor"
		static let currentTheme = "currentTheme"
	}

	private enum Defaults {
		static let appTintColor = Color.purple
		static let clockBackgroundColor = Color.white
		static let clockFont = Font.iAWriterDuospace
		static let clockTextColor = Color.black
	}

	static var current: Theme {
		get {
			let storedTheme = standardDefaults.integer(forKey: UserDefaultsKey.currentTheme)
			return Theme(rawValue: storedTheme) ?? .light
		}
		set {
			standardDefaults.set(newValue.rawValue, forKey: UserDefaultsKey.currentTheme)
			Theme.current.apply()
		}
	}

	static var clockTextColor: Theme.Color {
		get {
			let storedColorValue = standardDefaults.string(forKey: UserDefaultsKey.clockTextColor) ?? Defaults.clockTextColor.rawValue
			return Color(rawValue: storedColorValue) ?? Defaults.clockTextColor
		}
		set {
			standardDefaults.set(newValue.rawValue, forKey: UserDefaultsKey.clockTextColor)
			Theme.current.apply()
		}
	}

	static var clockBackgroundColor: Theme.Color {
		get {
			let storedColorValue = standardDefaults.string(forKey: UserDefaultsKey.clockBackgroundColor) ?? Defaults.clockBackgroundColor.rawValue
			return Color(rawValue: storedColorValue) ?? Defaults.clockBackgroundColor
		}
		set {
			standardDefaults.set(newValue.rawValue, forKey: UserDefaultsKey.clockBackgroundColor)
			Theme.current.apply()
		}
	}

	static var clockFont: Theme.Font {
		get {
			let storedFont = standardDefaults.string(forKey: UserDefaultsKey.clockFont) ?? Defaults.clockFont.rawValue
			return Theme.Font(rawValue: storedFont) ?? Defaults.clockFont
		}
		set {
			standardDefaults.set(newValue.rawValue, forKey: UserDefaultsKey.clockFont)
			Theme.current.apply()
		}
	}

}

// MARK: - Defined values by theme type

extension Theme {

	var appTintColor: UIColor {
		switch self {
		case .light:
			return Color.purple.uiColor
		case .dark:
			return Color.orange.uiColor
		}
	}

	var barStyle: UIBarStyle {
		switch self {
		case .light:
			return .default
		case .dark:
			return .black
		}
	}

	var backgroundColor: UIColor {
		switch self {
		case .light:
			return UIColor.groupTableViewBackground
		case .dark:
			return UIColor(white: 0.09, alpha: 1)
		}
	}

	var tableViewCellBackgroundColor: UIColor {
		switch self {
		case .light:
			return Color.white.uiColor
		case .dark:
			return Color.darkGray.uiColor
		}
	}

	var tableViewTextColor: UIColor {
		switch self {
		case .light:
			return UIColor.darkText
		case .dark:
			return UIColor.lightText
		}
	}

	var tableViewSeparatorColor: UIColor? {
		switch self {
		case .light:
			return nil // resets to default value
		case .dark:
			return Color.lightGray.uiColor
		}
	}

	var defaultClockBackgroundColor: UIColor {
		switch self {
		case .light:
			return Color.lightGray.uiColor
		case .dark:
			return Color.darkGray.uiColor
		}
	}

	var defaultClockTextColor: UIColor {
		switch self {
		case .light:
			return UIColor.darkText
		case .dark:
			return UIColor.lightText
		}
	}

	func apply() {
		UIApplication.shared.delegate?.window??.tintColor = appTintColor
		UINavigationBar.appearance().barStyle = barStyle

		UITableViewCell.appearance().backgroundColor = tableViewCellBackgroundColor
		UITableView.appearance().backgroundColor = backgroundColor
		UITableView.appearance().separatorColor = tableViewSeparatorColor

		UILabel.appearance().textColor = appTintColor

		UIApplication.shared.windows.forEach { window in
			window.subviews.forEach { subview in
				subview.removeFromSuperview()
				window.addSubview(subview)
			}
		}
	}

}

extension Theme.Font {

	func uiFont(ofSize size: CGFloat) -> UIFont {
		var font: UIFont?

		switch self {
		case .hack:
			font = FontFamily.Hack.regular.font(size: size)
		case .iAWriterDuospace:
			font = FontFamily.IAWriterDuospace.regular.font(size: size)
		case .lcd:
			font = FontFamily.Lcd._14.font(size: size)
		default:
			break
		}

		return font ?? UIFont.monospacedDigitSystemFont(ofSize: size, weight: .regular)
	}

}

extension Theme.Color {

	var uiColor: UIColor {
		switch self {
		case .red:       return UIColor(red: 255, green: 59, blue: 48)
		case .orange:    return UIColor(red: 255, green: 149, blue: 0)
		case .yellow:    return UIColor(red: 255, green: 204, blue: 0)
		case .green:     return UIColor(red: 76, green: 217, blue: 100)
		case .teal:      return UIColor(red: 90, green: 200, blue: 250)
		case .blue:      return UIColor(red: 0, green: 122, blue: 255)
		case .purple:    return UIColor(red: 88, green: 86, blue: 214)
		case .pink:      return UIColor(red: 255, green: 45, blue: 85)
		case .white:     return UIColor.white
		case .lightGray: return UIColor(whitePercentage: 25)
		case .darkGray:  return UIColor(white: 0.11, alpha: 0.73)
		case .black:     return UIColor.black
		}
	}

}

extension UIColor {
	/// Convenience initializer for creating an opaque UIColor
	convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
		self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
	}

	/// Convenience initializer for creating an opaque grayscale UIColor
	convenience init(whitePercentage: CGFloat) {
		self.init(white: whitePercentage / 100, alpha: 1)
	}
}

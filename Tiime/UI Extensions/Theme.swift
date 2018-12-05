// Created by Isaac Halvorson on 9/20/18

import UIKit

enum Theme: Int, CaseIterable, UserDefaultsInteracting {

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
		case white
		case lightGray
		case darkGray
		case black
	}
}

// MARK: - UserDefaults Getters and Setters

extension Theme {

	private enum UserDefaultsKey {
		static let currentTheme = "currentTheme"
		static let clockFont = "clockFont"
		static let clockBackgroundColor = "clockBackgroundColor"
		static let clockTextColor = "clockTextColor"
		static let appTintColor = "appTintColor"
	}

	static var current: Theme {
		get {
			let storedTheme = UserDefaults.standard.integer(forKey: UserDefaultsKey.currentTheme)
			return Theme(rawValue: storedTheme) ?? .light
		}
		set {
			UserDefaults.standard.set(newValue.rawValue, forKey: UserDefaultsKey.currentTheme)
			Theme.current.apply()
		}
	}

	static var clockTextColor: Color {
		get {
			let storedColorValue = UserDefaults.standard.string(forKey: UserDefaultsKey.clockTextColor) ?? Color.black.rawValue
			return Color(rawValue: storedColorValue) ?? Color.black
		}
		set {
			UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.clockTextColor)
			Theme.current.apply()
		}
	}

	static var clockBackgroundColor: Color {
		get {
			let storedColorValue = UserDefaults.standard.string(forKey: UserDefaultsKey.clockTextColor) ?? Color.white.rawValue
			return Color(rawValue: storedColorValue) ?? Color.white
		}
		set {
			UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.clockTextColor)
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
			return UIColor.white
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

	func apply() {
		UIApplication.shared.delegate?.window??.tintColor = appTintColor
		UINavigationBar.appearance().barStyle = barStyle
		UITabBar.appearance().barStyle = barStyle

		UITableViewCell.appearance().backgroundColor = tableViewCellBackgroundColor
		UITableView.appearance().backgroundColor = backgroundColor

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

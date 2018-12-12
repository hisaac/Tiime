// Created by Isaac Halvorson on 9/20/18

import UIKit

/// Base Theme enum that stores light or dark settings, as well as font and color options
enum Theme: Int, CaseIterable {

	case light = 0
	case dark = 1

	init(darkMode: Bool) {
		self = darkMode ? .dark : .light
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

	enum Defaults {
		static let appTintColor = ThemeColor.purple
		static let clockFont = ThemeFont.iAWriterDuospace

		static var clockBackgroundColor: UIColor {
			switch Theme.current {
			case .light: return ThemeColor.lightGray.rawValue
			case .dark: return ThemeColor.darkGray.rawValue
			}
		}

		static var clockTextColor: UIColor {
			switch Theme.current {
			case .light: return UIColor.darkText
			case .dark: return UIColor.lightText
			}
		}
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

//	var clockTextColor: Theme.Color {
//		get {
//			return Defaults.clockTextColor
////			guard let storedColorValue = standardDefaults.string(forKey: UserDefaultsKey.clockTextColor) else {
////				return Defaults.clockTextColor
////			}
////
////			return Color(rawValue: storedColorValue) ?? Defaults.clockTextColor
//		}
//		set {
//			standardDefaults.set(newValue.rawValue, forKey: UserDefaultsKey.clockTextColor)
//			Theme.current.apply()
//		}
//	}
//
//	var clockBackgroundColor: Theme.Color {
//		get {
//			return Defaults.clockBackgroundColor
////			guard let storedColorValue = standardDefaults.string(forKey: UserDefaultsKey.clockBackgroundColor) else {
////				return Defaults.clockBackgroundColor
////			}
////
////			return Color(rawValue: storedColorValue) ?? Defaults.clockBackgroundColor
//		}
//		set {
//			standardDefaults.set(newValue.rawValue, forKey: UserDefaultsKey.clockBackgroundColor)
//			Theme.current.apply()
//		}
//	}
//
//	static var clockFont: Theme.Font {
//		get {
//			let storedFont = standardDefaults.string(forKey: UserDefaultsKey.clockFont) ?? Defaults.clockFont.rawValue
//			return Theme.Font(rawValue: storedFont) ?? Defaults.clockFont
//		}
//		set {
//			standardDefaults.set(newValue.rawValue, forKey: UserDefaultsKey.clockFont)
//			Theme.current.apply()
//		}
//	}

}

// MARK: - Defined values by theme type

extension Theme {

	var appTintColor: UIColor {
		switch self {
		case .light: return ThemeColor.purple.rawValue
		case .dark: return ThemeColor.orange.rawValue
		}
	}

	var barStyle: UIBarStyle {
		switch self {
		case .light: return .default
		case .dark: return .black
		}
	}

	var backgroundColor: UIColor {
		switch self {
		case .light: return UIColor.groupTableViewBackground
		case .dark: return UIColor(white: 0.09, alpha: 1)
		}
	}

	var tableViewCellBackgroundColor: UIColor {
		switch self {
		case .light: return ThemeColor.white.rawValue
		case .dark: return ThemeColor.darkGray.rawValue
		}
	}

	var tableViewTextColor: UIColor {
		switch self {
		case .light: return UIColor.darkText
		case .dark: return UIColor.lightText
		}
	}

	var tableViewSeparatorColor: UIColor? {
		switch self {
		case .light: return nil // resets to default value
		case .dark: return ThemeColor.lightGray.rawValue
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

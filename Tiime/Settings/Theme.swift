// Created by Isaac Halvorson on 9/20/18

import UIKit

/// Base Theme enum that stores light or dark settings, as well as font and color options
enum Theme: Int, CaseIterable {

	case light = 0
	case dark = 1

	init(darkMode: Bool) {
		self = darkMode ? .dark : .light
	}

	static func toggleCurrentTheme() {
		if Theme.current == .light {
			Theme.current = .dark
		} else {
			Theme.current = .light
		}

		Theme.current.apply()
	}

}

// MARK: - UserDefaults Getters and Setters

extension Theme: UserDefaultsInteracting {

	private enum UserDefaultsKey {
		static let clockBackgroundColor = "clockBackgroundColor"
		static let clockFont = "clockFont"
		static let clockTextColor = "clockTextColor"
		static let currentTheme = "currentTheme"
		static let appIcon = "appIcon"
	}

	enum DefaultValues {
		static let appTintColor = ThemeColor.purple
		static let clockFont = ThemeFont.iAWriterDuospace
		static let appIcon = ThemeIcon.afternoon

		static var clockBackgroundColor: UIColor {
			switch Theme.current {
			case .light: return ThemeColor.white.rawValue
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

	static var clockBackgroundColor: UIColor {
		get {
			return standardDefaults.color(forKey: UserDefaultsKey.clockBackgroundColor) ?? DefaultValues.clockBackgroundColor
		}
		set {
			standardDefaults.set(color: newValue, forKey: UserDefaultsKey.clockBackgroundColor)
		}
	}

	static var clockTextColor: UIColor {
		get {
			return standardDefaults.color(forKey: UserDefaultsKey.clockTextColor) ?? DefaultValues.clockTextColor
		}
		set {
			standardDefaults.set(color: newValue, forKey: UserDefaultsKey.clockTextColor)
		}
	}

	static var clockFont: ThemeFont {
		get {
			let storedFontName = standardDefaults.string(forKey: UserDefaultsKey.clockFont) ?? DefaultValues.clockFont.rawValue
			return ThemeFont(rawValue: storedFontName) ?? DefaultValues.clockFont
		}
		set {
			standardDefaults.set(newValue.rawValue, forKey: UserDefaultsKey.clockFont)
		}
	}

	static var appIcon: ThemeIcon {
		get {
			let storedIconName = standardDefaults.string(forKey: UserDefaultsKey.appIcon) ?? DefaultValues.appIcon.rawValue
			return ThemeIcon(rawValue: storedIconName) ?? DefaultValues.appIcon
		}
		set {
			standardDefaults.set(newValue.rawValue, forKey: UserDefaultsKey.appIcon)
		}
	}

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

	var preferredStatusBarStyle: UIStatusBarStyle {
		switch self {
		case .light: return .default
		case .dark: return .lightContent
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

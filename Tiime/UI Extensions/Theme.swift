// Created by Isaac Halvorson on 9/20/18

import UIKit

/// The different theme settings for the app
struct Theme {

	private static let clockBackgroundColorKey = "clockBackgroundColor"
	private static let clockBackgroundColorDefault = Color.white

	private static let clockFontKey = "clockFont"
	private static let clockFontDefault = UIFont.systemFont(ofSize: UIFont.systemFontSize)

	private static let clockTextColorKey = "clockTextColor"
	private static let clockTextColorDefault = Color.black

	private static let appTintColorKey = "appTintColor"
	private static let appTintColorDefault = Color.purple

	/// Colors taken from the Chameleon library:
	enum Color: String, CaseIterable {

		init?(_ rawValue: String?) {
			guard let rawValue = rawValue else { return nil }
			self.init(rawValue: rawValue)
		}

		case black = "Black"
		case blue = "Blue"
		case brown = "Brown"
		case coffee = "Coffee"
		case forestGreen = "Forest Green"
		case gray = "Gray"
		case green = "Green"
		case lime = "Lime"
		case magenta = "Magenta"
		case maroon = "Maroon"
		case mint = "Mint"
		case navyBlue = "Navy Blue"
		case orange = "Orange"
		case pink = "Pink"
		case plum = "Plum"
		case powderBlue = "Powder Blue"
		case purple = "Purple"
		case red = "Red"
		case sand = "Sand"
		case skyBlue = "Sky Blue"
		case teal = "Teal"
		case watermelon = "Watermelon"
		case white = "White"
		case yellow = "Yellow"
		case darkBlack = "Dark Black"
		case darkBlue = "Dark Blue"
		case darkBrown = "Dark Brown"
		case darkCoffee = "Dark Coffee"
		case darkForestGreen = "Dark Forest Green"
		case darkGray = "Dark Gray"
		case darkGreen = "Dark Green"
		case darkLime = "Dark Lime"
		case darkMagenta = "Dark Magenta"
		case darkMaroon = "Dark Maroon"
		case darkMint = "Dark Mint"
		case darkNavyBlue = "Dark Navy Blue"
		case darkOrange = "Dark Orange"
		case darkPink = "Dark Pink"
		case darkPlum = "Dark Plum"
		case darkPowderBlue = "Dark Powder Blue"
		case darkPurple = "Dark Purple"
		case darkRed = "Dark Red"
		case darkSand = "Dark Sand"
		case darkSkyBlue = "Dark Sky Blue"
		case darkTeal = "Dark Teal"
		case darkWatermelon = "Dark Watermelon"
		case darkWhite = "Dark White"
		case darkYellow = "Dark Yellow"
	}

	static var clockBackgroundColor: Color {
		get {
			return getColorFromUserDefaults(key: clockBackgroundColorKey) ?? clockBackgroundColorDefault
		}
		set {
			UserDefaults.standard.set(newValue.rawValue, forKey: clockBackgroundColorKey)
		}
	}

	static var clockTextColor: Color {
		get {
			return getColorFromUserDefaults(key: clockTextColorKey) ?? clockTextColorDefault
		}
		set {
			UserDefaults.standard.set(newValue.rawValue, forKey: clockTextColorKey)
		}
	}

	static var clockFont: UIFont {
		get {
			return UserDefaults.standard.object(forKey: clockFontKey) as? UIFont ?? clockFontDefault
		}
		set {
			UserDefaults.standard.set(newValue, forKey: clockFontKey)
		}
	}

	static var appTintColor: Color {
		get {
			return getColorFromUserDefaults(key: appTintColorKey) ?? appTintColorDefault
		}
		set {
			UserDefaults.standard.set(newValue.rawValue, forKey: appTintColorKey)
		}
	}

	private static func getColorFromUserDefaults(key: String) -> Color? {
		let rawValue = UserDefaults.standard.string(forKey: key)
		return Color(rawValue)
	}

}

extension Theme.Color {

	var uiColor: UIColor {
		switch self {

		// Light shades

		case .black:       return hsb(0, 0, 17)
		case .blue:        return hsb(224, 50, 63)
		case .brown:       return hsb(24, 45, 37)
		case .coffee:      return hsb(25, 31, 64)
		case .forestGreen: return hsb(138, 45, 37)
		case .gray:        return hsb(184, 10, 65)
		case .green:       return hsb(145, 77, 80)
		case .lime:        return hsb(74, 70, 78)
		case .magenta:     return hsb(283, 51, 71)
		case .maroon:      return hsb(5, 65, 47)
		case .mint:        return hsb(168, 86, 74)
		case .navyBlue:    return hsb(210, 45, 37)
		case .orange:      return hsb(28, 85, 90)
		case .pink:        return hsb(324, 49, 96)
		case .plum:        return hsb(300, 45, 37)
		case .powderBlue:  return hsb(222, 24, 95)
		case .purple:      return hsb(253, 52, 77)
		case .red:         return hsb(6, 74, 91)
		case .sand:        return hsb(42, 25, 94)
		case .skyBlue:     return hsb(204, 76, 86)
		case .teal:        return hsb(195, 55, 51)
		case .watermelon:  return hsb(356, 53, 94)
		case .white:       return hsb(192, 2, 95)
		case .yellow:      return hsb(48, 99, 100)

		// Dark shades

		case .darkBlack:       return hsb(0, 0, 15)
		case .darkBlue:        return hsb(224, 56, 51)
		case .darkBrown:       return hsb(25, 45, 31)
		case .darkCoffee:      return hsb(25, 34, 56)
		case .darkForestGreen: return hsb(135, 44, 31)
		case .darkGray:        return hsb(184, 10, 55)
		case .darkGreen:       return hsb(145, 78, 68)
		case .darkLime:        return hsb(74, 81, 69)
		case .darkMagenta:     return hsb(282, 61, 68)
		case .darkMaroon:      return hsb(4, 68, 40)
		case .darkMint:        return hsb(168, 86, 63)
		case .darkNavyBlue:    return hsb(210, 45, 31)
		case .darkOrange:      return hsb(24, 100, 83)
		case .darkPink:        return hsb(327, 57, 83)
		case .darkPlum:        return hsb(300, 46, 31)
		case .darkPowderBlue:  return hsb(222, 28, 84)
		case .darkPurple:      return hsb(253, 56, 64)
		case .darkRed:         return hsb(6, 78, 75)
		case .darkSand:        return hsb(42, 30, 84)
		case .darkSkyBlue:     return hsb(204, 78, 73)
		case .darkTeal:        return hsb(196, 54, 45)
		case .darkWatermelon:  return hsb(358, 61, 85)
		case .darkWhite:       return hsb(204, 5, 78)
		case .darkYellow:      return hsb(40, 100, 100)
		}
	}

	private func hsb(_ hue: CGFloat, _ saturation: CGFloat, _ brightness: CGFloat) -> UIColor {
		return UIColor(hue: hue / 360, saturation: saturation / 100, brightness: brightness / 100, alpha: 1)
	}

}

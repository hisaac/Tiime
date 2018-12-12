// Created by Isaac Halvorson on 12/12/18

import UIKit

/// Colors from Apple's Human Interface Guidelines
/// reference: https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/
///
enum ThemeColor: CaseIterable {
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

extension ThemeColor: RawRepresentable {
	typealias RawValue = UIColor

	// swiftlint:disable:next cyclomatic_complexity
	init?(rawValue: UIColor) {
		switch rawValue {
		case #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1): self = .red
		case #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1): self = .orange
		case #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1): self = .yellow
		case #colorLiteral(red: 0.2980392157, green: 0.8509803922, blue: 0.3921568627, alpha: 1): self = .green
		case #colorLiteral(red: 0.3529411765, green: 0.7843137255, blue: 0.9803921569, alpha: 1): self = .teal
		case #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1): self = .blue
		case #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1): self = .purple
		case #colorLiteral(red: 1, green: 0.1764705882, blue: 0.3333333333, alpha: 1): self = .pink
		case #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1): self = .white
		case #colorLiteral(red: 0.3179988265, green: 0.3179988265, blue: 0.3179988265, alpha: 1): self = .lightGray
		case #colorLiteral(red: 0.1465101838, green: 0.1465101838, blue: 0.1465101838, alpha: 0.73): self = .darkGray
		case #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1): self = .black
		default: return nil
		}
	}

	var rawValue: UIColor {
		switch self {
		case .red:       return #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
		case .orange:    return #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1)
		case .yellow:    return #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
		case .green:     return #colorLiteral(red: 0.2980392157, green: 0.8509803922, blue: 0.3921568627, alpha: 1)
		case .teal:      return #colorLiteral(red: 0.3529411765, green: 0.7843137255, blue: 0.9803921569, alpha: 1)
		case .blue:      return #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
		case .purple:    return #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)
		case .pink:      return #colorLiteral(red: 1, green: 0.1764705882, blue: 0.3333333333, alpha: 1)
		case .white:     return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		case .lightGray: return #colorLiteral(red: 0.3179988265, green: 0.3179988265, blue: 0.3179988265, alpha: 1)
		case .darkGray:  return #colorLiteral(red: 0.1465101838, green: 0.1465101838, blue: 0.1465101838, alpha: 0.73)
		case .black:     return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		}
	}
}

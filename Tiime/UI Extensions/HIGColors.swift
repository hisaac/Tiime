// Created by Isaac Halvorson on 8/16/18

import UIKit

/// Colors from Apple's Human Interface Guidelines
/// reference: https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/
///
enum HIGColor {
	case red
	case orange
	case yellow
	case green
	case tealBlue
	case blue
	case purple
	case pink
}

extension HIGColor: RawRepresentable, CaseIterable {
	typealias RawValue = UIColor

	init?(rawValue: UIColor) {
		switch rawValue {
		case UIColor(red: 255, green: 59, blue: 48, alpha: 1): self = .red
		case UIColor(red: 255, green: 149, blue: 0, alpha: 1): self = .orange
		case UIColor(red: 255, green: 204, blue: 0, alpha: 1): self = .yellow
		case UIColor(red: 76, green: 217, blue: 100, alpha: 1): self = .green
		case UIColor(red: 90, green: 200, blue: 250, alpha: 1): self = .tealBlue
		case UIColor(red: 0, green: 122, blue: 255, alpha: 1): self = .blue
		case UIColor(red: 88, green: 86, blue: 214, alpha: 1): self = .purple
		case UIColor(red: 255, green: 45, blue: 85, alpha: 1): self = .pink
		default: return nil
		}
	}

	var rawValue: RawValue {
		switch self {
		case .red: return UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1)
		case .orange: return UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
		case .yellow: return UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
		case .green: return UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
		case .tealBlue: return UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
		case .blue: return UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
		case .purple: return UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
		case .pink: return UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1)
		}
	}
}

/// UIColor values for easy use
extension UIColor {
	static var higRed: UIColor { return HIGColor.red.rawValue }
	static var higOrange: UIColor { return HIGColor.orange.rawValue }
	static var higYellow: UIColor { return HIGColor.yellow.rawValue }
	static var higGreen: UIColor { return HIGColor.green.rawValue }
	static var higTealBlue: UIColor { return HIGColor.tealBlue.rawValue }
	static var higBlue: UIColor { return HIGColor.blue.rawValue }
	static var higPurple: UIColor { return HIGColor.purple.rawValue }
	static var higPink: UIColor { return HIGColor.pink.rawValue }
}

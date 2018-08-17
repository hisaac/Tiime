// Created by Isaac Halvorson on 6/9/18

import UIKit

extension UIColor {
	/// Convenience struct for colors defined in Apple's Human Interface Guidelines
	/// source: https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/color/
	struct HIGColors {
		static var red: UIColor {
			return UIColor(red: 1, green: 0.23, blue: 0.19, alpha: 1)
		}

		static var orange: UIColor {
			return UIColor(red: 1, green: 0.58, blue: 0, alpha: 1)
		}

		static var yellow: UIColor {
			return UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
		}

		static var green: UIColor {
			return UIColor(red: 0.3, green: 0.85, blue: 0.39, alpha: 1)
		}

		static var tealBlue: UIColor {
			return UIColor(red: 0.35, green: 0.78, blue: 0.98, alpha: 1)
		}

		static var blue: UIColor {
			return UIColor(red: 0, green: 0.48, blue: 1, alpha: 1)
		}

		static var purple: UIColor {
			return UIColor(red: 0.35, green: 0.34, blue: 0.84, alpha: 1)
		}

		static var pink: UIColor {
			return UIColor(red: 1, green: 0.18, blue: 0.33, alpha: 1)
		}
	}
}

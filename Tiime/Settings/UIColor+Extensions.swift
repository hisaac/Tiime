// Created by Isaac Halvorson on 12/12/18

import UIKit

extension UIColor {
	/// Convenience initializer for creating an opaque UIColor
	convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
		self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
	}

	/// Convenience initializer for creating an opaque grayscale UIColor
	convenience init(whitePercentage: CGFloat) {
		self.init(white: whitePercentage / 100, alpha: 1)
	}

	/// Generates a square image filled with the specified color
	/// Source: https://stackoverflow.com/a/48441178/4118208
	///
	func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
		return UIGraphicsImageRenderer(size: size).image { rendererContext in
			self.setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}

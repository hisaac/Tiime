// Created by Isaac Halvorson on 12/12/18

import UIKit

enum ThemeFont: String, CaseIterable {
	case hack = "Hack"
	case iAWriterDuo = "iA Writer Duo"
	case lcd = "LCD"
}

extension ThemeFont {

	/// The fully specified name of the font
	var fontName: String {
		switch self {
		case .hack: return "Hack-Regular"
		case .iAWriterDuo: return "iAWriterDuoV-Regular"
		case .lcd: return "LCD14"
		}
	}

	var uiFont: UIFont {
		return
			UIFont(name: fontName, size: UIFont.systemFontSize) ??
			UIFont.monospacedDigitSystemFont(ofSize: UIFont.systemFontSize, weight: .regular)
	}
}

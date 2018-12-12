// Created by Isaac Halvorson on 12/12/18

import UIKit

enum ThemeFont: CaseIterable {
	case hack
	case iAWriterDuospace
	case lcd
}

extension ThemeFont: RawRepresentable {
	typealias RawValue = UIFont

	init?(rawValue: UIFont) {
		return nil
	}

	var rawValue: UIFont {
		return
			UIFont(name: fontName, size: UIFont.systemFontSize) ??
			UIFont.monospacedDigitSystemFont(ofSize: UIFont.systemFontSize, weight: .regular)
	}

	var fontName: String {
		switch self {
		case .hack: return "Hack-Regular"
		case .iAWriterDuospace: return "iAWriterDuospace-Regular"
		case .lcd: return "LCD14"
		}
	}

	var fontNameForDisplay: String {
		switch self {
		case .hack: return "Hack"
		case .iAWriterDuospace: return "iA Writer Duospace"
		case .lcd: return "LCD"
		}
	}
}

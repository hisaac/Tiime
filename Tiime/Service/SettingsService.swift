// Created by Isaac Halvorson on 9/18/18

import Foundation

/// ⚙️ Handles reading and writing settings data to and from UserDefaults
///
struct SettingsService: UserDefaultsInteracting {

}

enum Settings: String {

	case clockBackgroundColor
	case clockFont
	case clockTextColor

}

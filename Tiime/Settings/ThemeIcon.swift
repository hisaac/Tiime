// Created by Isaac Halvorson on 12/14/18

import UIKit

/// An enum for holding reference to the alternate app icons
enum ThemeIcon: String, CaseIterable {
	case dawn
	case sunrise
	case morning
	case midmorning
	case noon
	case afternoon
	case evening
	case dusk
	case midnight
	case beta
}

extension ThemeIcon {

	/// The image representation of the icon
	var image: UIImage {
		switch self {
		case .dawn:       return #imageLiteral(resourceName: "dawn")
		case .sunrise:    return #imageLiteral(resourceName: "sunrise")
		case .morning:    return #imageLiteral(resourceName: "morning")
		case .midmorning: return #imageLiteral(resourceName: "midmorning")
		case .noon:       return #imageLiteral(resourceName: "noon")
		case .afternoon:  return #imageLiteral(resourceName: "afternoon")
		case .evening:    return #imageLiteral(resourceName: "evening")
		case .dusk:       return #imageLiteral(resourceName: "dusk")
		case .midnight:   return #imageLiteral(resourceName: "midnight")
		case .beta:       return #imageLiteral(resourceName: "beta")
		}
	}

	/// The name of the image for display
	var name: String {
		switch self {
		case .dawn:       return "Dawn"
		case .sunrise:    return "Sunrise"
		case .morning:    return "Morning"
		case .midmorning: return "Midmorning"
		case .noon:       return "Noon"
		case .afternoon:  return "Afternoon"
		case .evening:    return "Evening"
		case .dusk:       return "Dusk"
		case .midnight:   return "Midnight"
		case .beta:       return "Beta"
		}
	}
}

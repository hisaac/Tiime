// Created by Isaac Halvorson on 12/15/18

import os.log
import UIKit

class AboutViewModel {

	@objc let aboutCell: UITableViewCell = {
		let cell = UITableViewCell(style: .default, reuseIdentifier: #function)

		cell.textLabel?.text = aboutText
		cell.textLabel?.lineBreakMode = .byWordWrapping
		cell.textLabel?.numberOfLines = 0

		return cell
	}()

	@objc let thanksRyanCell: UITableViewCell = {
		let cell = UITableViewCell(style: .value1, reuseIdentifier: #function)
		cell.textLabel?.text = "Ryan Lower"
		cell.detailTextLabel?.text = "App Icon Design"
		cell.accessoryType = .disclosureIndicator
		return cell
	}()

	static let aboutText: String = {
		guard let aboutTextFilePath = Bundle.main.path(forResource: "about", ofType: "txt") else {
			return ""
		}

		do {
			let aboutText = try String(contentsOfFile: aboutTextFilePath)
			return String(aboutText.dropLast()) // Drop the last newline character
		} catch {
			if #available(iOS 12.0, *) {
				os_log(.error, "Error looking up about.txt file: %@", error.localizedDescription)
			} else {
				os_log("Error looking up about.txt file: %@", log: .default, type: .error, error.localizedDescription)
			}

			return ""
		}
	}()

}

// Created by Isaac Halvorson on 10/5/18

import QuickTableViewController

class SettingsViewController: QuickTableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Settings"

		navigationItem.largeTitleDisplayMode = .always
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			title: L10n.done,
			style: .plain,
			target: self,
			action: #selector(dismissSettings)
		)

		tableContents = [
			Section(
				title: "UI Settings",
				rows: [
					SwitchRow(title: "Dark Mode", switchValue: Theme.current == .dark, icon: nil, customization: nil) { row in
						guard let row = row as? SwitchRow else { return }
						Theme.current = Theme(darkMode: row.switchValue)
					}
				]
			),
			RadioSection(
				title: "Clock Text Color",
				options: [
					OptionRow(title: "Black", isSelected: true, action: nil),
					OptionRow(title: "White", isSelected: false, action: nil),
					OptionRow(title: "Red", isSelected: false, action: nil)
				]
			),
			RadioSection(
				title: "Font",
				options: [
					OptionRow(title: "Default", isSelected: true, action: nil),
					OptionRow(title: "Hack", isSelected: false, action: nil),
					OptionRow(title: "iA Writer Duospace", isSelected: false, action: nil),
					OptionRow(title: "LCD", isSelected: false, action: nil)
				]
			)
//			Section(
//				title: "Navigation",
//				rows: [
//					NavigationRow(
//						title: "CellStyle.default",
//						subtitle: .none,
//						icon: .named("gear")
//					),
//					NavigationRow(
//						title: "CellStyle",
//						subtitle: .belowTitle(".subtitle"),
//						icon: .named("globe")
//					),
//					NavigationRow(
//						title: "CellStyle",
//						subtitle: .rightAligned(".value1"),
//						icon: .named("time"),
//						action: { [weak self] in
//							self?.showDetail($0)
//						}
//					),
//					NavigationRow(
//						title: "CellStyle",
//						subtitle: .leftAligned(".value2")
//					)
//				]
//			),
		]
	}

	var colors: [OptionRow<UITableViewCell>] {
		return Theme.Color.allCases.map {
			return OptionRow(
				title: $0.rawValue.localizedCapitalized,
				isSelected: false,
				icon: nil,
				customization: { cell, row in

				}, action: { row in

				}
			)
		}
	}

	private func showAlert(_ sender: Row) {

	}

	private func showDetail(_ sender: Row) {

	}

	@objc private func dismissSettings() {
		dismiss(animated: true)
	}

}

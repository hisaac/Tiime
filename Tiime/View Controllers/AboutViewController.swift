// Created by Isaac Halvorson on 12/15/18

import UIKit

class AboutViewController: UITableViewController {

	var sections: [TableViewSection] = []
	let viewModel = AboutViewModel()

	convenience init() {
		self.init(style: .grouped)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = NSLocalizedString("It's About Tiime", comment: "Title for the About screen")
		tableView.allowsSelection = true
		setupSections()
	}

	func setupSections() {
		let aboutSection = TableViewSection(
			cells: [
				viewModel.aboutCell,
				viewModel.codeCell
			]
		)

		let developerSection = TableViewSection(
			header: "👨🏻‍💻 Developer",
			cells: [
				viewModel.hisaacTwitterCell,
				viewModel.isaacWebsiteCell,
				viewModel.isaacEmailCell
			]
		)

		let thanksSection = TableViewSection(
			header: "🙏 Thanks",
			cells: [
				viewModel.thanksRyanCell,
				viewModel.thanksEliCell
			]
		)

		sections = [aboutSection, developerSection, thanksSection]
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].cells.count
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sections[section].header
	}

	override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		return sections[section].footer
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return sections[indexPath.section].cells[indexPath.row]
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		let cell = sections[indexPath.section].cells[indexPath.row]

		switch cell.reuseIdentifier {
		case #keyPath(AboutViewModel.hisaacTwitterCell):
			let hisaacTwitterURL = URL(staticString: "https://twitter.com/hisaac/")
			UIApplication.shared.open(hisaacTwitterURL, options: [:])
		case #keyPath(AboutViewModel.isaacWebsiteCell):
			let isaacWebsiteURL = URL(staticString: "https://hisaac.net/")
			UIApplication.shared.open(isaacWebsiteURL, options: [:])
		case #keyPath(AboutViewModel.isaacEmailCell):
			let isaacEmailURL = URL(staticString: "mailto:tiime@level.software")
			UIApplication.shared.open(isaacEmailURL, options: [:])
		case #keyPath(AboutViewModel.thanksRyanCell):
			let ryanTwitterURL = URL(staticString: "https://twitter.com/beautyislikeyea/")
			UIApplication.shared.open(ryanTwitterURL, options: [:])
		case #keyPath(AboutViewModel.thanksEliCell):
			let eliWebsiteURL = URL(staticString: "https://eli.li/")
			UIApplication.shared.open(eliWebsiteURL, options: [:])
		default:
			return
		}
	}

}

extension URL {
	init(staticString string: StaticString) {
		guard let url = URL(string: "\(string)") else {
			preconditionFailure("Invalid static URL string: \(string)")
		}

		self = url
	}
}

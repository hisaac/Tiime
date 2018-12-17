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
		var url: URL?

		switch cell.reuseIdentifier {
		case #keyPath(AboutViewModel.codeCell):
			url = URL(staticString: "https://github.com/hisaac/tiime/")
		case #keyPath(AboutViewModel.hisaacTwitterCell):
			url = URL(staticString: "https://twitter.com/hisaac/")
		case #keyPath(AboutViewModel.isaacWebsiteCell):
			url = URL(staticString: "https://hisaac.net/")
		case #keyPath(AboutViewModel.isaacEmailCell):
			url = URL(staticString: "mailto:tiime@level.software")
		case #keyPath(AboutViewModel.thanksRyanCell):
			url = URL(staticString: "https://twitter.com/beautyislikeyea/")
		case #keyPath(AboutViewModel.thanksEliCell):
			url = URL(staticString: "https://eli.li/")
		default:
			return
		}

		if let url = url {
			UIApplication.shared.open(url, options: [:])
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

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
		title = NSLocalizedString("About", comment: "Title for the About screen")
		tableView.allowsSelection = true
		setupSections()
	}

	func setupSections() {
		let aboutSection = TableViewSection(cells: [viewModel.aboutCell])

		let thanksSection = TableViewSection(
			header: "🙏 Thanks",
			cells: [
				viewModel.thanksRyanCell
			],
			footer: "Thanks also to Katie Holmes for helping me with Adobe Illustrator and Sketch"
		)

		sections = [aboutSection, thanksSection]
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
		let cell = sections[indexPath.section].cells[indexPath.row]
		cell.textLabel?.textColor = Theme.current.tableViewTextColor
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		let cell = sections[indexPath.section].cells[indexPath.row]

		switch cell.reuseIdentifier {
		case #keyPath(AboutViewModel.thanksRyanCell):
			guard let ryanTwitterURL = URL(string: "https://twitter.com/beautyislikeyea") else { return }
			UIApplication.shared.open(ryanTwitterURL, options: [:])
		default:
			return
		}
	}

}

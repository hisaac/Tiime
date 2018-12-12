// Created by Isaac Halvorson on 12/12/18

import UIKit

struct TableViewSection {
	let header: String?
	var cells: [UITableViewCell]
	let footer: String?

	init(header: String? = nil,
	     cells: [UITableViewCell],
	     footer: String? = nil) {
		self.header = header
		self.cells = cells
		self.footer = footer
	}
}

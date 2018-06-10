// Created by Isaac Halvorson on 6/9/18

import UIKit

class DetailNavigationController: UINavigationController {
	override func viewDidLoad() {
		super.viewDidLoad()
		pushViewController(EmptyDetailViewController(), animated: false)
	}
}

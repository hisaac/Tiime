// Created by Isaac Halvorson on 5/8/18

// swiftlint:disable line_length

import Foundation
import UIKit

// Inspired by a talk given by [Lea Sunschein](http://hellosunschein.com) at [RWDevCon 2018](https://www.rwdevcon.com)

// MARK: NSLayoutConstraint Convenience methods

extension NSLayoutConstraint {
	// Pins an attribute of a view to an attribute of another view
	static func pinning(view: UIView, attribute: NSLayoutConstraint.Attribute, toView: UIView?, toAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint {
		return NSLayoutConstraint(item: view, attribute: attribute, relatedBy: .equal, toItem: toView, attribute: toAttribute, multiplier: multiplier, constant: constant)
	}

	// Pins an array of NSLayoutAttributes of a view to a specific view (has to respect view tree hierarchy)
	static func pinning(view: UIView, toView: UIView?, attributes: [NSLayoutConstraint.Attribute], multiplier: CGFloat, constant: CGFloat) -> [NSLayoutConstraint] {
		return attributes.map({ attribute -> NSLayoutConstraint in
			NSLayoutConstraint(item: view, attribute: attribute, relatedBy: .equal, toItem: toView, attribute: attribute, multiplier: multiplier, constant: constant)
		})
	}

	// Pins bottom, top, leading and trailing of a view to a specific view (has to respect view tree hierarchy)
	static func pinningEdges(view: UIView, toView: UIView?) -> [NSLayoutConstraint] {
		let attributes: [NSLayoutConstraint.Attribute] = [.top, .bottom, .leading, .trailing]
		return NSLayoutConstraint.pinning(view: view, toView: toView, attributes: attributes, multiplier: 1.0, constant: 0.0)
	}

	// Pins bottom, top, leading and trailing of a view to its superview
	static func pinningEdgesToSuperview(view: UIView) -> [NSLayoutConstraint] {
		return NSLayoutConstraint.pinningEdges(view: view, toView: view.superview)
	}

	// Pins specified attribute to superview with specified or default multiplier and constant
	static func pinningToSuperview(view: UIView, attributes: [NSLayoutConstraint.Attribute], multiplier: CGFloat, constant: CGFloat) -> [NSLayoutConstraint] {
		return NSLayoutConstraint.pinning(view: view, toView: view.superview, attributes: attributes, multiplier: multiplier, constant: constant)
	}
}

// MARK: UIView Convenience methods

extension UIView {
	func pinEdgesToSuperview() {
		guard let superview = superview else { return }
		translatesAutoresizingMaskIntoConstraints = false
		let constraints = NSLayoutConstraint.pinningEdgesToSuperview(view: self)
		superview.addConstraints(constraints)
	}

	func pinToSuperview(forAttributes attributes: [NSLayoutConstraint.Attribute], multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
		guard let superview = superview else { return }
		translatesAutoresizingMaskIntoConstraints = false
		let constraints = NSLayoutConstraint.pinningToSuperview(view: self, attributes: attributes, multiplier: multiplier, constant: constant)
		superview.addConstraints(constraints)
	}

	func pin(toView: UIView, attributes: [NSLayoutConstraint.Attribute], multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
		guard let superview = superview else { return }
		translatesAutoresizingMaskIntoConstraints = false
		let constraints = NSLayoutConstraint.pinning(view: self, toView: toView, attributes: attributes, multiplier: multiplier, constant: constant)
		superview.addConstraints(constraints)
	}

	func pin(attribute: NSLayoutConstraint.Attribute, toView: UIView?, toAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
		guard let superview = superview else { return }
		translatesAutoresizingMaskIntoConstraints = false
		let constraint = NSLayoutConstraint.pinning(view: self, attribute: attribute, toView: toView, toAttribute: toAttribute, multiplier: multiplier, constant: constant)
		superview.addConstraint(constraint)
	}
}

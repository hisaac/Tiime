//
// MetricTime.swift
// Created by Isaac Halvorson on 6/22/18
//

import Foundation

struct MetricTime: TimeRepresentable {
	var timeForDisplay: String {
		let numberFormatter = NumberFormatter()
		numberFormatter.minimumFractionDigits = 3

		let floored = floor(Date().universalMetricTime) / 1000
		let metricTimeString = numberFormatter.string(for: floored) ?? "?"

		return "\(metricTimeString) UMT"
	}

	var timeTypeTitle: String {
		return ClockType.metric.name
	}
}

/// Metric Time information and conversions found at https://zapatopi.net/metrictime/
extension Date {
	var universalMetricTime: Double {
		var calendar = Calendar.autoupdatingCurrent
		guard let umt = TimeZone(secondsFromGMT: 43_200) else { return -1 }
		calendar.timeZone = umt

		let startOfDay = calendar.startOfDay(for: self)
		let seconds = timeIntervalSince(startOfDay)
		return seconds / 0.864
	}

	var localMetricTime: Double {
		var calendar = Calendar.autoupdatingCurrent
		guard let timeZone = TimeZone(secondsFromGMT: 0) else { return -1 }
		calendar.timeZone = timeZone

		let startOfDay = calendar.startOfDay(for: self)
		let seconds = timeIntervalSince(startOfDay)
		return seconds / 0.864
	}
}

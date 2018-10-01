// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// Tiime
  internal static let applicationName = L10n.tr("Localizable", "Application Name")
  /// Dismiss
  internal static let dismiss = L10n.tr("Localizable", "Dismiss")
  /// Settings
  internal static let settings = L10n.tr("Localizable", "Settings")

  internal enum TimeType {
    internal enum Device {
      /// The time displayed in the default way for the device's locale
      internal static let description = L10n.tr("Localizable", "TimeType.Device.description")
      /// Device Time
      internal static let title = L10n.tr("Localizable", "TimeType.Device.title")
    }
    internal enum Metric {
      /// The day is divided into units of tenths, hundredths, thousands, etc.
      internal static let description = L10n.tr("Localizable", "TimeType.Metric.description")
      /// Metric Time
      internal static let title = L10n.tr("Localizable", "TimeType.Metric.title")
    }
    internal enum Unix {
      /// The amount of seconds since January 1, 1970
      internal static let description = L10n.tr("Localizable", "TimeType.Unix.description")
      /// Unix Time
      internal static let title = L10n.tr("Localizable", "TimeType.Unix.title")
    }
    internal enum Beat {
      /// The day is divided into 1000 "beats"
      internal static let description = L10n.tr("Localizable", "TimeType.beat.description")
      /// .beat Time
      internal static let title = L10n.tr("Localizable", "TimeType.beat.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String) -> String {
    return NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
  }

  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

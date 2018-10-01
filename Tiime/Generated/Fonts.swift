// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
  internal typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
  internal typealias Font = UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum Hack {
    internal static let bold = FontConvertible(name: "Hack-Bold", family: "Hack", path: "Hack-Bold.ttf")
    internal static let boldItalic = FontConvertible(name: "Hack-BoldItalic", family: "Hack", path: "Hack-BoldItalic.ttf")
    internal static let italic = FontConvertible(name: "Hack-Italic", family: "Hack", path: "Hack-Italic.ttf")
    internal static let regular = FontConvertible(name: "Hack-Regular", family: "Hack", path: "Hack-Regular.ttf")
    internal static let all: [FontConvertible] = [bold, boldItalic, italic, regular]
  }
  internal enum Lcd {
    internal static let _14 = FontConvertible(name: "LCD14", family: "LCD", path: "LCD14.otf")
    internal static let _14Condensed = FontConvertible(name: "LCD14Condensed", family: "LCD", path: "LCD14Condensed.otf")
    internal static let _14Italic = FontConvertible(name: "LCD14Italic", family: "LCD", path: "LCD14Italic.otf")
    internal static let _14ItalicCondensed = FontConvertible(name: "LCD14ItalicCondensed", family: "LCD", path: "LCD14ItalicCondensed.otf")
    internal static let all: [FontConvertible] = [_14, _14Condensed, _14Italic, _14ItalicCondensed]
  }
  internal enum IAWriterDuospace {
    internal static let bold = FontConvertible(name: "iAWriterDuospace-Bold", family: "iA Writer Duospace", path: "iAWriterDuospace-Bold.ttf")
    internal static let boldItalic = FontConvertible(name: "iAWriterDuospace-BoldItalic", family: "iA Writer Duospace", path: "iAWriterDuospace-BoldItalic.ttf")
    internal static let regular = FontConvertible(name: "iAWriterDuospace-Regular", family: "iA Writer Duospace", path: "iAWriterDuospace-Regular.ttf")
    internal static let regularItalic = FontConvertible(name: "iAWriterDuospace-RegularItalic", family: "iA Writer Duospace", path: "iAWriterDuospace-RegularItalic.ttf")
    internal static let all: [FontConvertible] = [bold, boldItalic, regular, regularItalic]
  }
  internal static let allCustomFonts: [FontConvertible] = [Hack.all, Lcd.all, IAWriterDuospace.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  internal func font(size: CGFloat) -> Font! {
    return Font(font: self, size: size)
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    let bundle = Bundle(for: BundleToken.self)
    return bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension Font {
  convenience init!(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

private final class BundleToken {}

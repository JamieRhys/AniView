// swiftlint:disable:this file_name
// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist



#if os(macOS)
#if hasFeature(InternalImportsByDefault)
public import AppKit
#else
import AppKit
#endif
#else
#if hasFeature(InternalImportsByDefault)
public import UIKit
#else
import UIKit
#endif
#endif

#if canImport(SwiftUI)
#if hasFeature(InternalImportsByDefault)
public import SwiftUI
#else
import SwiftUI
#endif
#endif

// MARK: - Asset Catalogs

public enum DesignSystemAsset: Sendable {
  public static let accent = DesignSystemColors(name: "Accent")
  public static let background = DesignSystemColors(name: "Background")
  public static let border = DesignSystemColors(name: "Border")
  public static let disabledText = DesignSystemColors(name: "DisabledText")
  public static let error = DesignSystemColors(name: "Error")
  public static let highlight = DesignSystemColors(name: "Highlight")
  public static let info = DesignSystemColors(name: "Info")
  public static let link = DesignSystemColors(name: "Link")
  public static let placeholder = DesignSystemColors(name: "Placeholder")
  public static let primary = DesignSystemColors(name: "Primary")
  public static let primaryText = DesignSystemColors(name: "PrimaryText")
  public static let secondary = DesignSystemColors(name: "Secondary")
  public static let secondaryText = DesignSystemColors(name: "SecondaryText")
  public static let shadow = DesignSystemColors(name: "Shadow")
  public static let success = DesignSystemColors(name: "Success")
  public static let surface = DesignSystemColors(name: "Surface")
  public static let warning = DesignSystemColors(name: "Warning")
}

// MARK: - Implementation Details

public final class DesignSystemColors: Sendable {
  public let name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  public var color: Color {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIColor: SwiftUI.Color {
      return SwiftUI.Color(asset: self)
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension DesignSystemColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: DesignSystemColors) {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS) || os(visionOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Color {
  init(asset: DesignSystemColors) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }
}
#endif

// swiftformat:enable all
// swiftlint:enable all

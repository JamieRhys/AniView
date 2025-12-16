//
// Colors.swift
// DesignSystem
//
// Created by Jamie-Rhys Edwards on 12/12/2025
//

import UIKit

/// A collection of colour assets used throughout the design system.
///
/// Each static property maps directly to a named colour in the package's asset catalog.
/// These colours are the single source of truth for all UI components and should be used
/// instead of hard-coded values to ensure consistent theming across the app.
///
/// Colours are loaded in from the Swift package's resource bundle using `UIColor(named:in:compatibleWith)`.
public enum Colors {
    /// The primary accent colour used for highlights and interactive elements.
    public static let accent = UIColor(named: "Accent", in: #bundle, compatibleWith: nil)!
    
    /// The default background colour for screens and components.
    public static let background = UIColor(named: "Background", in: #bundle, compatibleWith: nil)!
    
    /// Standard border colour for separators and component outlines.
    public static let border = UIColor(named: "Border", in: #bundle, compatibleWith: nil)!
    
    /// Colour applied to disabled or inactive text elements.
    public static let disabledText = UIColor(named: "DisabledText", in: #bundle, compatibleWith: nil)!
    
    /// Colour used to represent error states and distructive actions.
    public static let error = UIColor(named: "Error", in: #bundle, compatibleWith: nil)!
    
    /// Highlight colour for focused or selected elements.
    public static let highlight = UIColor(named: "Highlight", in: #bundle, compatibleWith: nil)!
    
    /// Informational colour used for neutral system messages.
    public static let info = UIColor(named: "Info", in: #bundle, compatibleWith: nil)!
    
    /// Colour used for tappable links and inline actions.
    public static let link = UIColor(named: "Link", in: #bundle, compatibleWith: nil)!
    
    /// Placeholder text colour for textfields.
    public static let placeholder = UIColor(named: "Placeholder", in: #bundle, compatibleWith: nil)!
    
    /// Primary brand colour used for key UI actions.
    public static let primary = UIColor(named: "Primary", in: #bundle, compatibleWith: nil)!
    
    /// Default text colour used on primary surfaces.
    public static let primaryText = UIColor(named: "PrimaryText", in: #bundle, compatibleWith: nil)!
    
    /// Secondary brand colour for complementary accents.
    public static let secondary = UIColor(named: "Secondary", in: #bundle, compatibleWith: nil)!
    
    /// Default text colour used on secondary surfaces.
    public static let secondaryText = UIColor(named: "SecondaryText", in: #bundle, compatibleWith: nil)!
    
    /// Drop shadow colour for elevated components.
    public static let shadow = UIColor(named: "Shadow", in: #bundle, compatibleWith: nil)!
    
    /// Colour used to represent successful operations.
    public static let success = UIColor(named: "Success", in: #bundle, compatibleWith: nil)!
    
    /// Surface colour for cards, modals and containers.
    public static let surface = UIColor(named: "Surface", in: #bundle, compatibleWith: nil)!
    
    /// Warning colour used to indicate cautionary states.
    public static let warning = UIColor(named: "Warning", in: #bundle, compatibleWith: nil)!
}

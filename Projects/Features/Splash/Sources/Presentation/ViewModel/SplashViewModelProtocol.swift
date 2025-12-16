//
//  SplashViewModelProtocol.swift
//  Splash
//
//  Created by Jamie-Rhys Edwards on 15/12/2025.
//

import Foundation
import RxCocoa

import Core

/// `SplashViewModelProtocol` defines the requried interface and outputs for the Splash screen's business logic.
///
/// All properties are exposed as `RxCocoa`'s `Driver` to ensure they are observed on the main thread and share
/// the subscription's side effects.
protocol SplashViewModelProtocol {
    /// A reactive stream indicating the current status of the splash screen's initialisation process.
    ///
    /// The stream emits values of the ``LoadingState`` enum.
    var loadingState: Driver<LoadingState> { get }
    
    /// A reactive stream providing the text to be displayed in the main title for the splash screen.
    ///
    /// - Note: This value typically comes from a localised string or configuration
    var titleLabel: Driver<String> { get }
    
    /// A reactive stream providing the name of the system or custom icon to be displayed as the completion indicator.
    var tickIcon: Driver<String> { get }
}

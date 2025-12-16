//
//  LoadingState.swift
//  Core
//
//  Created by Jamie-Rhys Edwards on 14/12/2025.
//

import Foundation

/// A set of states representing the lifecycle of an asynchronous loading operation.
///
/// This enum should be used to drive UI changes.
public enum LoadingState {
    /// The initial or reset state, indicating no operation is currently in progress.
    ///
    /// Typically used as the default state before a request is initiated.
    case idle
    
    /// The state used to indicate that an asynchronous operation, such as a network request
    /// is currently running.
    case loading
    
    /// The state reached when the asynchonous operation has successfully completed and data
    /// (if applicable) is ready to be ingested.
    case loaded
    
    /// The state indicating that an asynchronous operation has failed due to an error.
    case failed
}

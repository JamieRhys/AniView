//
//  CoordinatorProtocol.swift
//  Core
//
//  Created by Jamie-Rhys Edwards on 13/12/2025.
//

import UIKit

/// A protocol defining the responsibilities of a coordinator.
///
/// Coordinators are responsible for managing navigation flow and owning the
/// lifecycle of child coordinators.
public protocol CoordinatorProtocol: AnyObject {
    
    /// The coordinators that are owned by this coordinator.
    ///
    /// Child coordinators should be retained for the duration of their navigation flow
    /// and removed when that flow finishes.
    var childCoordinators: [CoordinatorProtocol] { get set }
    
    /// The navigation controller used to present view controllers.
    ///
    /// Coordinators use this navigation controller to push/pop view controllers
    /// as part of their flow.
    var navController: UINavigationController { get set }
    
    /// Starts the coordinators flow.
    ///
    /// This method is typically called once when the coordinator is first created.
    func start()
    
    /// Notifies the coordinator when a child coordinator has finished.
    ///
    /// Implementation should remove the given child coordinator from
    /// `childCoordinators` and perform and required cleanup.
    ///
    /// - Parameter child: The child coordinator that finished, or `nil` if no
    ///   child coordinator is available.
    func childDidFinish(_ child: CoordinatorProtocol?)
    
    /// Ends the coordinator's navigation flow.
    ///
    /// Implementation should perform any necessary teardown and notify any parent
    /// coordinator that this flow has completed.
    func end()
}

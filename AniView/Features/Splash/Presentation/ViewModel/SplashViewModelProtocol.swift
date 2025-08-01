//
//  SplashViewModelProtocol.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import Foundation
import RxCocoa

protocol SplashViewModelProtocol {
    var loadingState: Driver<LoadingState> { get }
}

//
//  SplashViewModel.swift
//  Splash
//
//  Created by Jamie-Rhys Edwards on 13/12/2025.
//

import Foundation
import RxSwift
import RxCocoa
import OSLog

import Core

public final class SplashViewModel {
    private let disposeBag: DisposeBag!

    private struct ViewState {
        let loadingState = BehaviorRelay<LoadingState>(value: LoadingState.loading)
        let titleLabel = BehaviorRelay<String>(value: String(localized: "appName", bundle: .module))
        let tickIcon = BehaviorRelay<String>(value: String("checkmark.circle"))
    }
    
    private let viewState = ViewState()
    
    init() {
        self.disposeBag = DisposeBag()
    }
}

extension SplashViewModel: SplashViewModelProtocol {
    var loadingState: Driver<LoadingState> { viewState.loadingState.asDriver() }
    var titleLabel: Driver<String> { viewState.titleLabel.asDriver() }
    var tickIcon: Driver<String> { viewState.tickIcon.asDriver() }
}

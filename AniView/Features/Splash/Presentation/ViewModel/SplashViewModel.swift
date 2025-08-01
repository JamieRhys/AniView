//
//  SplashViewModel.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import Foundation
import RxSwift
import RxCocoa

final class SplashViewModel {
    private let repository: SplashRepositoryProtocol!
    private let disposeBag: DisposeBag!
    
    private struct State {
        let loadingState = BehaviorRelay<LoadingState>(value: LoadingState.loading)
    }
    
    private let state = State()
    
    init(
        repository: SplashRepositoryProtocol,
    ) {
        self.repository = repository
        self.disposeBag = DisposeBag()
    }
}

extension SplashViewModel: SplashViewModelProtocol {
    var loadingState: Driver<LoadingState> {
        state.loadingState.asDriver()
    }
}

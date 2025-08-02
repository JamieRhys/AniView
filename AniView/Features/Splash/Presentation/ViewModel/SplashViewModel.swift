//
//  SplashViewModel.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import Foundation
import RxSwift
import RxCocoa
import OSLog

final class SplashViewModel {
    private let repository: SplashRepositoryProtocol!
    private let disposeBag: DisposeBag!
    
    private struct State {
        let loadingState = BehaviorRelay<LoadingState>(value: LoadingState.loading)
        let labelTitle = BehaviorRelay<String>(value: NSLocalizedString("label.app_name", comment: ""))
        let iconTick = BehaviorRelay<String>(value: "checkmark.circle")
    }
    
    private let state = State()
    
    init(
        repository: SplashRepositoryProtocol,
    ) {
        self.repository = repository
        self.disposeBag = DisposeBag()
        
        fetchData()
    }
    
    private func fetchData() {
        Task {
            await repository.fetchAllBreeds() { result in
                switch result {
                case .success:
                    Logger.viewcycle.info("Loaded")
                    self.state.loadingState.accept(LoadingState.loaded)
                case .failure(let error):
                    Logger.statistics.error("Failed to fetch breeds: \(error)")
                }
            }
        }
    }
}

extension SplashViewModel: SplashViewModelProtocol {
    var iconTick: Driver<String> {
        state.iconTick.asDriver()
    }
    
    var loadingState: Driver<LoadingState> {
        state.loadingState.asDriver()
    }
    
    var labelTitle: Driver<String> {
        state.labelTitle.asDriver()
    }
}

//
//  SplashViewController.swift
//  Splash
//
//  Created by Jamie-Rhys Edwards on 15/12/2025.
//

import OSLog
import RxSwift
import SnapKit
import UIKit

import Core
import DesignSystem

class SplashViewController: UIViewController {
    var parentCoordinator: SplashCoordinator?
    private let viewModel: SplashViewModel
    private let disposeBag: DisposeBag
    
    private let mainContainer = UIStackView()
    private let titleLabel = UILabel.headline(text: "")
    private let progressIndicator = UIActivityIndicatorView(style: .large)
    private let tickIconView = UIImageView()
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented.") }
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureBindings()
        setupUi()
        setupConstraints()
    }
    
    private func configureBindings() {
        viewModel
            .titleLabel
            .drive(onNext: { [weak self] text in
                self?.titleLabel.text = text
            })
            .disposed(by: disposeBag)
        
        viewModel
            .loadingState
            .drive(onNext: { [weak self] state in
                switch state {
                    case LoadingState.loading:
                        self?.progressIndicator.startAnimating()
                    case LoadingState.loaded:
                        self?.progressIndicator.stopAnimating()
                        self?.tickIconView.isHidden = false
                        // TODO: Start Switch Timer once implemented in ViewModel.
                    default:
                        Logger.viewcycle.error("Unknown Loading State: \(state)")
                }
            })
            .disposed(by: disposeBag)
        
        viewModel
            .tickIcon
            .drive(onNext: { [weak self] systemName in
                self?.tickIconView.image = UIImage(systemName: systemName)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupUi() {
        view.backgroundColor = Colors.background
        
        titleLabel.textInsets = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: Spacing.extraLarge,
            right: 0
        )
        
        progressIndicator.hidesWhenStopped = true
        
        tickIconView.isHidden = true
        tickIconView.tintColor = Colors.primary
        
        mainContainer.axis = .vertical
        mainContainer.alignment = .center
        
        mainContainer.addArrangedSubview(titleLabel)
        mainContainer.addArrangedSubview(progressIndicator)
        mainContainer.addArrangedSubview(tickIconView)
        
        view.addSubview(mainContainer)
    }
    
    private func setupConstraints() {
        mainContainer.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        })
    }
}

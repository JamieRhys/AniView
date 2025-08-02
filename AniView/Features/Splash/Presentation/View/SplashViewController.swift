//
//  SplashViewController.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import UIKit
import SnapKit
import RxSwift
import OSLog

final class SplashViewController: UIViewController {
    private let viewModel: SplashViewModelProtocol
    private let disposeBag: DisposeBag
    var coordinator: SplashCoordinator?
    
    private let labelTitle = UILabel.headline(text: "")
    private let progressIndicator = UIActivityIndicatorView(style: .large)
    private var iconTickView = UIImageView()
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
        setupUi()
        setupConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        coordinator?.end()
    }
    
    private func configureBindings() {
        viewModel
            .labelTitle
            .drive(onNext: { [weak self] text in
                self?.labelTitle.text = text
            })
            .disposed(by: disposeBag)
        
        viewModel
            .loadingState
            .drive(onNext: { [weak self] state in
                switch state {
                case LoadingState.loading:
                    self?.progressIndicator.startAnimating()
                case LoadingState.loaded:
                    Logger.statistics.info("Loaded")
                    self?.progressIndicator.stopAnimating()
                    self?.progressIndicator.isHidden = true
                    self?.iconTickView.isHidden = false
                    self?.coordinator?.startSwitchTimer()
                default:
                    Logger.viewcycle.error("Loading state: \(state)")
                }
            })
            .disposed(by: disposeBag)
        
        viewModel
            .iconTick
            .drive(onNext: { [weak self] systemName in
                self?.iconTickView.image = UIImage(systemName: systemName)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupUi() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [AppColor.primary.cgColor, AppColor.background.cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0.75, y: 0.75)
        view.layer.insertSublayer(gradient, at: 0)
        
        labelTitle.textAlignment = .center
        
        iconTickView.tintColor = AppColor.textPrimary
        iconTickView.isHidden = true
        
        view.addSubview(labelTitle)
        view.addSubview(progressIndicator)
        view.addSubview(iconTickView)
    }
    
    private func setupConstraints() {
        labelTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        progressIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelTitle.snp.bottom).offset(16)
        }
        
        iconTickView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelTitle.snp.bottom).offset(16)
        }
    }
}

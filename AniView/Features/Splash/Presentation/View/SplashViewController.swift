//
//  SplashViewController.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import UIKit
import SnapKit
import OSLog

final class SplashViewController: UIViewController {
    private let viewModel: SplashViewModel
    var coordinator: SplashCoordinator?
    
    private let mainContainer = UIStackView()
    
    private let labelTitle = UILabel.headline(text: NSLocalizedString("label.app_name", comment: "Title of the app"))
    
    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator?.startTimer()
        setupUi()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        coordinator?.end()
    }
    
    private func setupUi() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [AppColor.primary.cgColor, AppColor.background.cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0.75, y: 0.75)
        view.layer.insertSublayer(gradient, at: 0)
        
        
        labelTitle.textAlignment = .center
        
        view.addSubview(labelTitle)
        
        labelTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

    }
}

//
//  SearchViewController.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import UIKit
import OSLog

final class SearchViewController: UIViewController {
    private let viewModel: SearchViewModel
    var coordinator: SearchCoordinator?
    
    private let topBar = UIStackView()
    private let labelAppTitle = UILabel.body(text: "AniView")
    private let textfieldSearch = UITextField.capsulePrimary(placeholder: "Search for dogs...")
    private let buttonRandom = UIButton(configuration: .icon(systemImageName: "shuffle.circle.fill"))
    private let resultsTable = UITableView()
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init?(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
        setupUi()
        setupConstraints()
    }
    
    private func configureBindings() {

    }
    
    private func setupUi() {
        view.backgroundColor = AppColor.background
        
        topBar.backgroundColor = AppColor.surface
        topBar.axis = .horizontal
        topBar.alignment = .center
        topBar.layer.cornerRadius = 16
        view.addSubview(topBar)
        
        labelAppTitle.textInsets = UIEdgeInsets(
            top: AppSpacing.small,
            left: AppSpacing.medium,
            bottom: AppSpacing.small,
            right: AppSpacing.medium
        )
        topBar.addArrangedSubview(labelAppTitle)
        topBar.addArrangedSubview(textfieldSearch)
        topBar.addArrangedSubview(buttonRandom)
        
        resultsTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        resultsTable.backgroundColor = .blue
        view.addSubview(resultsTable)
    }
    
    private func setupConstraints() {
        topBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(AppSpacing.large)
        }
        
        resultsTable.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom).offset(AppSpacing.medium)
            make.leading.trailing.equalToSuperview().inset(AppSpacing.medium)
            make.bottom.equalToSuperview().inset(AppSpacing.large)
        }
    }
}

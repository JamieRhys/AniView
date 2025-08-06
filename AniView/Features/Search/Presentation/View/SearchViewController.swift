//
//  SearchViewController.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import UIKit
import OSLog
import RxSwift

final class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let viewModel: SearchViewModel
    var coordinator: SearchCoordinator?
    
    private var searchResults = [SearchResult]()
    private let disposeBag = DisposeBag()
    
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
        viewModel
            .searchResults
            .drive(onNext: { [weak self] results in
                self?.searchResults = results
                self?.resultsTable.reloadData()
            })
            .disposed(by: disposeBag)
        
        textfieldSearch.rx.text.orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in self?.onSearchTextChanged() })
            .disposed(by: disposeBag)
        
        buttonRandom.rx.tap
            .subscribe(onNext: { [weak self] _ in
                Task {
                    let breedId = await self?.viewModel.randomBreed()
                    self?.coordinator?.showDetailedView(breedId: breedId ?? -1)
                }
            })
            .disposed(by: disposeBag)
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
        resultsTable.delegate = self
        resultsTable.dataSource = self
        
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
    
    @objc private func onSearchTextChanged() {
        viewModel.search(for: textfieldSearch.text ?? "")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showDetailedView(breedId: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.textLabel!.text = searchResults[indexPath.row].name
        return cell
    }
}

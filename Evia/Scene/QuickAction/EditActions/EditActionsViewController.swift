//
//  EditActionViewController.swift
//  Evia
//
//  Created by Furkan on 30.03.2024.
//

import UIKit

class EditActionsViewController: UIViewController {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Edit Actions"
        label.font = .font(.interMedium, size: .h1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Icons.addPlus), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EditActionsTableViewCell.self, forCellReuseIdentifier: EditActionsTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let applyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appEdit
        button.setTitle("Apply", for: .normal)
        button.titleLabel?.font = .font(.interMedium, size: .h4)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(buttonContinueTapped), for: .touchUpInside)
        return button
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        applyConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        backButton()
    }

}

// MARK: - Layout
extension EditActionsViewController {
    private func setupViews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(titleStackView)
        scrollView.addSubview(tableView)
        scrollView.addSubview(applyButton)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(addButton)
        view.backgroundColor = .systemBackground
    }
    
    private func applyConstraints() {
        
        let applyButtonConstraints = [
            applyButton.widthAnchor.constraint(equalToConstant: 116),
            applyButton.heightAnchor.constraint(equalToConstant: 49),
            applyButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            applyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ]
        
        let titleStackViewConstraints = [
            titleStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            titleStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            titleStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ]
        
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
         
        let allConstraints = [
            applyButtonConstraints,
            titleStackViewConstraints,
            tableViewConstraints,
            scrollViewConstraints
        ]
        NSLayoutConstraint.activate(allConstraints.flatMap { $0 })
    }
}

// MARK: TableView
extension EditActionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EditActionsTableViewCell.identifier, for: indexPath) as? EditActionsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(NewQuickActionViewController(), animated: true)
    }
}

// MARK: - Actions
extension EditActionsViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func backButton() {
        let backbutton = UIBarButtonItem(image: UIImage(asset: Asset.Icons.back), style: .done, target: self, action: #selector(backbuttonTapped))
        navigationItem.leftBarButtonItem = backbutton
        navigationController?.navigationBar.tintColor = .appBlack
    }
    
    @objc private func backbuttonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

import SwiftUI
#if DEBUG

@available(iOS 13, *)
struct EditActionViewControllerPreview: PreviewProvider {
    static var previews: some View {
        EditActionsViewController().showPreview()
    }
}
#endif

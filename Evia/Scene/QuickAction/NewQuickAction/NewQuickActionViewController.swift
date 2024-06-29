//
//  NewQuickActionViewController.swift
//  Evia
//
//  Created by Furkan on 21.03.2024.
//

import UIKit

class NewQuickActionViewController: UIViewController {

    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Create New"
        label.font = .font(.interMedium, size: .large)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .font(.interRegular, size: .h6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameTextField = FloatLabelTextField()
    
    private let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let devicesLabel: UILabel = {
        let label = UILabel()
        label.text = "Devices"
        label.font = .font(.interMedium, size: .h4)
        return label
    }()
    
    private let devicesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: layout.itemSize.width * 3.2, height: layout.itemSize.height * 2.2) // 160 x 110
        layout.sectionInset = UIEdgeInsets(top: 0, left: layout.itemSize.width / 20, bottom: 0, right: layout.itemSize.height / 15) // 8 - 8
        layout.minimumLineSpacing = layout.itemSize.height / 7 // 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DevicesCollectionViewCell.self, forCellWithReuseIdentifier: DevicesCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appEdit
        button.setTitle("Apply", for: .normal)
        button.titleLabel?.font = .font(.interMedium, size: .h4)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonContinueTapped), for: .touchUpInside)
        return button
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let scrollView: UIScrollView = {
       let scrolView = UIScrollView()
        scrolView.translatesAutoresizingMaskIntoConstraints = false
        return scrolView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentConfigure()
        setupViews()
        applyConstraints()
        backButton()

        devicesCollectionView.delegate = self
        devicesCollectionView.dataSource = self
    }
}

// MARK: - Layout
extension NewQuickActionViewController {
    
    private func contentConfigure() {
        nameTextField.title = "Name"
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        scrollView.addSubview(continueButton)
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(textFieldStackView)
        mainStackView.addArrangedSubview(devicesLabel)
        mainStackView.addArrangedSubview(devicesCollectionView)
        topStackView.addArrangedSubview(topLabel)
        textFieldStackView.addArrangedSubview(titleLabel)
        textFieldStackView.addArrangedSubview(nameTextField)
        view.backgroundColor = .systemBackground
    }
    private func applyConstraints() {
        
        let devicesCollectionViewConstraints = [
            devicesCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            devicesCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 1.36) // 615
        ]
        
        let continueButtonConstraints = [
            continueButton.widthAnchor.constraint(equalToConstant: 116),
            continueButton.heightAnchor.constraint(equalToConstant: 49),
            continueButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ]
        
        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        ]
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let allConstraints = [
            devicesCollectionViewConstraints,
            continueButtonConstraints,
            mainStackViewConstraints,
            scrollViewConstraints
        ]
        NSLayoutConstraint.activate(allConstraints.flatMap { $0 })
    }
}

// MARK: - CollectionView
extension NewQuickActionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DevicesCollectionViewCell.identifier, for: indexPath) as? DevicesCollectionViewCell else {
            return UICollectionViewCell()
        }
            cell.contentView.backgroundColor = .appWeather
        return cell
    }
}

// MARK: - Actions
extension NewQuickActionViewController {
    
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
    
    @objc private func buttonContinueTapped() {
        self.navigationController?.pushViewController(HomeViewController(viewModel: DevicesViewModel()), animated: true)
    }
}

import SwiftUI
#if DEBUG

@available(iOS 13, *)
struct NewQuickActionViewControllerPreview: PreviewProvider {
    static var previews: some View {
        NewQuickActionViewController().showPreview()
    }
}
#endif

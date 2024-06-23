//
//  ForgotPasswordViewController.swift
//  Evia
//
//  Created by Furkan on 21.03.2024.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Forgot Password"
        label.font = .font(.interMedium, size: .h1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Confirm your email and we’ll send the instructions."
        label.font = .font(.interRegular, size: .h6)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let emailTextField = FloatLabelTextField()
    
    private let textFieldstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let resetPasswordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appWeather
        button.setTitle("Reset Password", for: .normal)
        button.titleLabel?.font = .font(.interMedium, size: .h4)
        button.setTitleColor(.appBlack, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonResetPasswordTapped), for: .touchUpInside)
        return button
    }()
    
    private let mainStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
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
        contentConfigure()
        setupViews()
        applyConstraints()
        backButton()

    }
}

// MARK: - Layout
extension ForgotPasswordViewController {
    private func contentConfigure() {
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        emailTextField.title = "Email Address"
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(textFieldstackView)
        mainStackView.addArrangedSubview(resetPasswordButton)
        textFieldstackView.addArrangedSubview(emailTextField)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(descriptionLabel)
        view.backgroundColor = .systemBackground
    }
    
    private func applyConstraints() {
        
        let resetPasswordButtonConstraints = [
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 63)
        ]
        
        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
          
        let allConstraints = [
            resetPasswordButtonConstraints,
            mainStackViewConstraints,
            scrollViewConstraints
        ]
        NSLayoutConstraint.activate(allConstraints.flatMap { $0 })
    }
}

// MARK: - Actions
extension ForgotPasswordViewController {
    
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
    
    @objc private func buttonResetPasswordTapped() {
        presentModalController()
    }
}

// MARK: - Bottom Sheet
extension ForgotPasswordViewController {
    
    private func presentModalController() {
        let customBottomSheetVC = CustomBottomSheetView()
        customBottomSheetVC.modalPresentationStyle = .overCurrentContext
        
        let image = UIImage(asset: Asset.Icons.plus)
        let title = "The email and password you entered did notmatch our records. Please try again."
        let actionButtonTitle = "Ok"
        
        customBottomSheetVC.setupContent(withImage: image, title: title, description: nil, actionButtonTitle: actionButtonTitle)
        customBottomSheetVC.actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        self.present(customBottomSheetVC, animated: true, completion: nil)
    }
    
    @objc private func actionButtonTapped() {
        self.dismiss(animated: true) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

import SwiftUI
#if DEBUG

@available(iOS 13, *)
struct ForgotPasswordViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ForgotPasswordViewController().showPreview()
    }
}
#endif

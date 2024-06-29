//
//  LoginViewController.swift
//  Evia
//
//  Created by Furkan on 20.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Images.house)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .font(.interMedium, size: .h1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back! Please enter your details."
        label.font = .font(.interRegular, size: .h6)
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
    private let passwordTextField = FloatLabelTextField()
    
    private let textFieldstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Forgot Password?"
        label.font = .font(.interRegular, size: .h5)
        label.textColor = .appBlack
        return label
    }()
    
    private let forgotPasswordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appWeather
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .font(.interMedium, size: .h4)
        button.setTitleColor(.appBlack, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonLoginTapped), for: .touchUpInside)
        return button
    }()
    
    private let haventAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Haven't Acount?"
        label.font = .font(.interRegular, size: .h5)
        label.textColor = .appDarkGray
        return label
    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up Now"
        label.font = .font(.interRegular, size: .h5)
        label.textColor = .appBlack
        return label
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        setupViews()
        applyConstraints()
        contentConfigure()
        view.backgroundColor = .systemBackground
        
        addTapGestureToForgotPassword()
        addTapGestureToSignInLabel()
        
        // Keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
}

// MARK: - Configure
extension LoginViewController {
    
    private func contentConfigure() {
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        emailTextField.title = "Email Address"
        passwordTextField.title = "Password"
        passwordTextField.isSecureTextEntry = true
    }
}

// MARK: - Layout
extension LoginViewController {
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(textFieldstackView)
        mainStackView.addArrangedSubview(forgotPasswordStackView)
        mainStackView.addArrangedSubview(loginButton)
        mainStackView.addArrangedSubview(bottomStackView)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(descriptionLabel)
        textFieldstackView.addArrangedSubview(emailTextField)
        textFieldstackView.addArrangedSubview(passwordTextField)
        forgotPasswordStackView.addArrangedSubview(forgotPasswordLabel)
        bottomStackView.addArrangedSubview(haventAccountLabel)
        bottomStackView.addArrangedSubview(signUpLabel)
    }
    
    private func applyConstraints() {
        let imageViewConstralnts = [
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ]
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 24),
            loginButton.heightAnchor.constraint(equalToConstant: 63)
        ]
        
        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let allConstraints = [
            imageViewConstralnts,
            loginButtonConstraints,
            mainStackViewConstraints,
            scrollViewConstraints
        ]
        NSLayoutConstraint.activate(allConstraints.flatMap { $0 })
    }
}

// MARK: - Keyboard Handling
extension LoginViewController {
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let keyboardHeight = keyboardFrame.height
            scrollView.contentInset.bottom = keyboardHeight
            scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset.bottom = 0
        scrollView.verticalScrollIndicatorInsets.bottom = 0
    }
}

// MARK: - Action
extension LoginViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func addTapGestureToForgotPassword() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped))
        forgotPasswordLabel.isUserInteractionEnabled = true
        forgotPasswordLabel.addGestureRecognizer(tapGesture)
    }
    @objc private func forgotPasswordTapped() {
        let forgotPasswordViewController = ForgotPasswordViewController()
        navigationController?.pushViewController(forgotPasswordViewController, animated: true)
    }
    
    @objc private func buttonLoginTapped() {
        self.presentModalController()
    }
    
    private func addTapGestureToSignInLabel() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(signUpLabelTapped))
        signUpLabel.isUserInteractionEnabled = true
        signUpLabel.addGestureRecognizer(tapGesture)
    }
    @objc private func signUpLabelTapped() {
        self.presentModalController()
    }
}

// MARK: - Bottom Sheet
extension LoginViewController {
    
    private func presentModalController() {
        let customBottomSheetVC = CustomBottomSheetView()
        customBottomSheetVC.modalPresentationStyle = .overCurrentContext
        
        let image = UIImage(asset: Asset.Icons.error)
        let title = "The email and password you entered did notmatch our records. Please try again."
        let actionButtonTitle = "Ok"
        
        customBottomSheetVC.setupContent(withImage: image, title: title, description: nil, actionButtonTitle: actionButtonTitle)
        customBottomSheetVC.actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        self.present(customBottomSheetVC, animated: true, completion: nil)
    }
    
    @objc private func actionButtonTapped() {
         self.dismiss(animated: true) {
            self.navigationController?.pushViewController(HomeViewController(viewModel: DevicesViewModel()), animated: true)
        }
    }
}

import SwiftUI
#if DEBUG

@available(iOS 13, *)
struct LoginViewControllerPreview: PreviewProvider {
    static var previews: some View {
        LoginViewController().showPreview()
    }
}
#endif

//
//  ViewController.swift
//  HiChat
//
//  Created by Artem Tkachev on 8.01.24.
//

import UIKit
import GoogleSignIn

class AuthViewController: UIViewController {
    
    let logoImageView = UIImageView(image: UIImage(named: "hi"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get start with")
    let emailLabel = UILabel(text: "Or sing up with")
    let alreadyOnboardLabel = UILabel(text: "Already onboard?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .black)
    let loginButton = UIButton(title: "Login", titleColor: .red, backgroundColor: .white, isShadow: true)
    
    let signUpViewController = SignUpViewController()
    let loginViewController = LoginViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        
        googleButton.customizeGoogleButton()
        setupConstraints()
        
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        signUpViewController.delegate = self
        loginViewController.delegate = self
    }
    
    @objc private func emailButtonTapped() {
        print(#function)
        present(signUpViewController, animated: true, completion: nil)
    }
    
    @objc private func loginButtonTapped() {
        print(#function)
        present(loginViewController, animated: true, completion: nil)
    }
}

// MARK: - Setup constraints

extension AuthViewController {
    
    private func setupConstraints() {
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyOnboardLabel, button: loginButton)
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
    }
}

extension AuthViewController: AuthNavigationDelegate {
    func toLoginVC() {
        present(loginViewController, animated: true, completion: nil)
    }
    
    func toSignUpVC() {
        present(signUpViewController, animated: true, completion: nil)
    }
}


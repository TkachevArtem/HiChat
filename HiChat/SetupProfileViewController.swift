//
//  SetupProfileViewController.swift
//  HiChat
//
//  Created by Artem Tkachev on 15.01.24.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let addPhotoImageView = AddPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        setupConstraints()
    }
    
    //
}

// MARK: - Setup constraints
extension SetupProfileViewController {
    
    private func setupConstraints() {
        
        addPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addPhotoImageView)
        NSLayoutConstraint.activate([
            addPhotoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            addPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - SwiftUI Canvas
import SwiftUI

struct SetupProfileViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SetupProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SetupProfileViewControllerProvider.ContainerView>) -> SetupProfileViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: SetupProfileViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SetupProfileViewControllerProvider.ContainerView>) {
            
        }
    }
}


//
//  WaitingChatCell.swift
//  HiChat
//
//  Created by Artem Tkachev on 27.01.24.
//

import UIKit

class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseID: String = "WaitingChatCell"
    
    let chatImageView = UIImageView()
    
    func configure(with value: HChat) {
        chatImageView.image = UIImage(named: value.userImageString)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        chatImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(chatImageView)
        
        NSLayoutConstraint.activate([
            chatImageView.topAnchor.constraint(equalTo: self.topAnchor),
            chatImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            chatImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            chatImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    
}

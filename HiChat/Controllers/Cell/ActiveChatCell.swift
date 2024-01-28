//
//  ActiveChatCell.swift
//  HiChat
//
//  Created by Artem Tkachev on 27.01.24.
//

import UIKit

class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseID: String = "ActiveChatCell"
    
    let chatImageView = UIImageView()
    let chatNameLabel = UILabel(text: "Chat Name", font: .laoSangamMN20())
    let lastMessageLabel = UILabel(text: "Last Message", font: .laoSangamMN18())
    let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1), endColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: HChat = value as? HChat else { return }
        chatImageView.image = UIImage(named: chat.userImageString)
        chatNameLabel.text = chat.userName
        lastMessageLabel.text = chat.lastMessage
    }
}

// MARK: - Setup constraints
extension ActiveChatCell {
    private func setupConstraints() {
        
        chatImageView.translatesAutoresizingMaskIntoConstraints = false
        chatNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        chatImageView.backgroundColor = #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1)
        addSubview(chatImageView)
        addSubview(gradientView)
        addSubview(chatNameLabel)
        addSubview(lastMessageLabel)
        
        
        NSLayoutConstraint.activate([
            chatImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            chatImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chatImageView.heightAnchor.constraint(equalToConstant: 78),
            chatImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 78),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
        NSLayoutConstraint.activate([
            chatNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            chatNameLabel.leadingAnchor.constraint(equalTo: chatImageView.trailingAnchor, constant: 16),
            chatNameLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            lastMessageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            lastMessageLabel.leadingAnchor.constraint(equalTo: chatImageView.trailingAnchor, constant: 16),
            lastMessageLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
        ])
    }
}

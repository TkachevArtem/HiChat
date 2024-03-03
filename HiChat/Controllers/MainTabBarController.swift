//
//  MainTabBarController.swift
//  HiChat
//
//  Created by Artem Tkachev on 18.01.24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let currentUser: HUser
    
    init(currentUser: HUser) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listVC = ListViewController(currentUser: currentUser)
        let peopleVC = PeopleViewController(currentUser: currentUser)
        
        tabBar.tintColor = .purple
        let boltConfig = UIImage.SymbolConfiguration(weight: .medium)
        guard let peopleImage = UIImage(systemName: "person.2", withConfiguration: boltConfig),
              let chatsImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boltConfig)
        else { return }
        
        viewControllers = [
            generateNavigationController(rootViewController: listVC, title: "Chats", image: chatsImage),
            generateNavigationController(rootViewController: peopleVC, title: "People", image: peopleImage)
            
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}

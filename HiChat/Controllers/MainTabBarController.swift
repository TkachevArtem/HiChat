//
//  MainTabBarController.swift
//  HiChat
//
//  Created by Artem Tkachev on 18.01.24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listVC = ListViewController()
        let peopleVC = PeopleViewController()
        
        tabBar.tintColor = .purple
        let boltConfig = UIImage.SymbolConfiguration(weight: .medium)
        guard let peopleImage = UIImage(systemName: "person.2", withConfiguration: boltConfig),
              let chatsImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boltConfig)
        else { return }
        
        viewControllers = [
            generateNavigationController(rootViewController: peopleVC, title: "People", image: peopleImage),
            generateNavigationController(rootViewController: listVC, title: "Chats", image: chatsImage)
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}

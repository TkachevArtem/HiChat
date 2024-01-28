//
//  UIViewController + Extension.swift
//  HiChat
//
//  Created by Artem Tkachev on 28.01.24.
//

import UIKit

extension UIViewController {
    
    func configure<T: SelfConfiguringCell, U: Hashable> (collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else { fatalError() }
        cell.configure(with: value)
        return cell
    }
}

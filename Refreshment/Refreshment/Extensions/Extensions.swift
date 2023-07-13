//
//  Extensions.swift
//  Refreshment
//
//  Created by Khawaja Abdul Haleem on 05/07/2023.
//

import UIKit

// MARK:  UIView
extension UIView {
    var loadNibView: UIView? {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        return nib.instantiate(withOwner: self, options: [:]).first as? UIView
    }
}

// MARK: UITableView
public extension UITableView {
    
    func registerNib(cell: ReusableCell.Type, in bundle: Bundle? = nil) {
        register(UINib(nibName: cell.ReuseId, bundle: bundle), forCellReuseIdentifier: cell.ReuseId)
    }
    
    func dequeueReusableCell<T: ReusableCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.ReuseId, for: indexPath ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseId)")
        }
        return cell
    }
    
}

// MARK:  UITableViewCell
extension UITableViewCell: ReusableCell {}

// MARK:  UICollectionView
public extension UICollectionView {
    
    func registerNib(cell: ReusableCell.Type, in bundle: Bundle? = nil) {
        register(UINib(nibName: cell.ReuseId, bundle: bundle), forCellWithReuseIdentifier: cell.ReuseId)
    }
    
    func dequeueReusableCell<T: ReusableCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.ReuseId, for: indexPath ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseId)")
        }
        return cell
    }
    
    func dequeueReusableSupplementaryView<T: ReusableCell>(ofKind kind: String, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.ReuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseId)")
        }
        return cell
    }
}

// MARK:  UICollectionViewCell
extension UICollectionViewCell: ReusableCell {}


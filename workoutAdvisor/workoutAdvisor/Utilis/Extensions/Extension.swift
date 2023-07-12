//
//  Extension.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 08/07/2023.
//

import UIKit

// MARK:  UIView
extension UIView {
    var loadNibView: UIView? {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        return nib.instantiate(withOwner: self, options: [:]).first as? UIView
    }
}

extension UIView {
    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }

    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0

        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.isHidden = true
            self.alpha = 0.0
        }, completion: completion)
    }
}

extension UIView {
    func roundTop(radius:CGFloat = 15){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
    }

    func roundBottom(radius:CGFloat = 5){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
    }
}

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
    
    func register(header: ReusableCell.Type, in bundle: Bundle? = nil) {
        register(UINib(nibName: header.ReuseId, bundle: bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: header.ReuseId)
    }
    
    func dequeueReusableSupplementaryView<T: ReusableCell>(ofKind kind: String, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.ReuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseId)")
        }
        return cell
    }
}

extension UICollectionViewCell: ReusableCell {}
extension UICollectionReusableView: ReusableCell {}


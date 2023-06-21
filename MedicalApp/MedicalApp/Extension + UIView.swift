//
//  Extension.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 12/06/2023.
//

import Foundation
import UIKit
import ReadMoreTextView

// MARK:  UITextView
extension UITextView {
    func textViewColorChange(For givenText: NSString,into color: UIColor, from locationNumber: Int, to length: Int){
        let myString:NSString = givenText
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
        
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: locationNumber,length: length))
        // set label Attribute
        self.attributedText = myMutableString
    }
    
    
}

// MARK:  ReadMoreTextView
extension ReadMoreTextView {
    func addReadButton() {
        self.maximumNumberOfLines = 4
        let readMore = StringConstant.readMore
        let readLess = StringConstant.readLess
        let font = UIFont.boldSystemFont(ofSize: 14)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: ColorConstant.lighBlueColor,
        
        ]
        let attributedReadMore = NSAttributedString(string: readMore, attributes: attributes)
        let attributedReadLess = NSAttributedString(string: readLess, attributes: attributes)
        self.attributedReadLessText = attributedReadLess
        self.attributedReadMoreText = attributedReadMore
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
    
    func dequeueReusableSupplementaryView<T: ReusableCell>(ofKind kind: String, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.ReuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseId)")
        }
        return cell
    }
}
    
// MARK:  UIView
extension UIView {
    var loadNibView: UIView? {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        return nib.instantiate(withOwner: self, options: [:]).first as? UIView
    }
}

extension UICollectionViewCell: ReusableCell {}

// MARK:  UIColor
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

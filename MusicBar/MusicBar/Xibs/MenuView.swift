//
//  MenuView.swift
//  MusicBar
//
//  Created by Khawaja Abdul Haleem on 02/06/2023.
//

import Foundation
import UIKit

protocol MenuViewProtocol {
    func menuButtonTapped()
}

class MenuView: UIView {
    let nibName = "MenuView"
    
    var contentView: UIView?
    
    var delegate: MenuViewProtocol?
    
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)

            guard let view = loadViewFromNib() else { return }
            view.frame = self.bounds
            self.addSubview(view)
            contentView = view
        }

        func loadViewFromNib() -> UIView? {
            let bundle = Bundle(for: type(of: self))
            let nib = UINib(nibName: nibName, bundle: bundle)
            return nib.instantiate(withOwner: self, options: nil).first as? UIView
        }
    
    
    
}

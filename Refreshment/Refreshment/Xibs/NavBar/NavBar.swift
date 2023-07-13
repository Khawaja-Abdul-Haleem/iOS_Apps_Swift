//
//  NavBar.swift
//  Refreshment
//
//  Created by Khawaja Abdul Haleem on 05/07/2023.
//

import UIKit

protocol NavBarProtocol {
    func backBtnTapped()
}

class NavBar: UIView {
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var likeView: UIView!
    
    @IBOutlet weak var profileIcon: UIImageView!
    
    var delegate: NavBarProtocol? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    @IBAction func menuBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func backBtnTapped(_ sender: UIButton) {
        delegate?.backBtnTapped()
    }
}

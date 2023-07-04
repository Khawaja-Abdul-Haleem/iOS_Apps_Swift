//
//  NavBar.swift
//  Orix-File-Manager
//
//  Created by Khawaja Abdul Haleem on 26/06/2023.
//

import UIKit

protocol NavBarProtocol {
    func leftButtonTapped()
}

class NavBar: UIView {
   
    @IBOutlet weak var leftButton: UIButton!
    
    var delegate: NavBarProtocol? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
   
    @IBAction func menuBtnTapped(_ sender: UIButton) {
        delegate?.leftButtonTapped()
    }
}

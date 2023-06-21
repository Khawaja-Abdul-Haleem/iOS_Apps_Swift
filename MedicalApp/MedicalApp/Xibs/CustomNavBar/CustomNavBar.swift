//
//  CustomTabBar.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 09/06/2023.
//

import UIKit

protocol CustomNavBarProtocol {
    func backButtontapped()
    
}

class CustomNavBar: UIView {
    
    
    @IBOutlet weak var navTitle: UILabel!
    
    var contentView: UIView?
    
    var delegate: CustomNavBarProtocol? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureView()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        delegate?.backButtontapped()
    }
    
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
    }
    
}


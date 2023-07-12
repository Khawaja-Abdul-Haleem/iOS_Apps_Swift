//
//  NavBar.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 08/07/2023.
//

import UIKit

class NavBar: UIView {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
            titleLabel.isUserInteractionEnabled = true
            titleLabel.addGestureRecognizer(tap)
        }
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var closedCaptionButton: UIButton!
    @IBOutlet weak var kebabMenuButton: UIButton!
    
    var delegate: NavBarProtocol? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        delegate?.backBtnTapped()
    }
   
    @IBAction func backBtntapped(_ sender: UIButton) {
        delegate?.backBtnTapped()
    }
   
    @IBAction func menuBtnTapped(_ sender: UIButton) {
        delegate?.menuBtnTapped()
    }
    
    @IBAction func ccBtnTapped(_ sender: UIButton) {
        delegate?.ccBtnTapped()
    }
}


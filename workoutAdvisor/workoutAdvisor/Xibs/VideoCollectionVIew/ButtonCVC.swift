//
//  ButtonCVC.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 10/07/2023.
//

import UIKit

class ButtonCVC: UICollectionViewCell {

    @IBOutlet weak var workoutBtn: UIButton!
    
    var delegate: ButtonCVCProtocol? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func workoutBtnTapped(_ sender: UIButton) {
        delegate?.workoutBtnTapped()
    }
}

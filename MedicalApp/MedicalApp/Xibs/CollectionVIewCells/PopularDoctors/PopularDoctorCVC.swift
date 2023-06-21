//
//  PopularDoctorCVC.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 07/06/2023.
//

import UIKit

class PopularDoctorCVC: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var doctorImage: UIImageView!
    
    @IBOutlet weak var drName: UILabel!
    
    @IBOutlet weak var drField: UILabel!
    
    @IBOutlet weak var drPlace: UILabel!
    
    @IBOutlet weak var bgView: RoundedView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

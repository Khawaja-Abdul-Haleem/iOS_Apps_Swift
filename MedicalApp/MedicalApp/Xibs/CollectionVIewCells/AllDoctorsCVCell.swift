//
//  AllDoctorsCVCell.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 09/06/2023.
//

import UIKit

class AllDoctorsCVCell: UICollectionViewCell {

    @IBOutlet weak var bgView: RoundedView!
    
    @IBOutlet weak var docImage: RoundedImageView!
    
    @IBOutlet weak var docName: UILabel!
    
    @IBOutlet weak var drField: UILabel!
    
    @IBOutlet weak var drPlace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

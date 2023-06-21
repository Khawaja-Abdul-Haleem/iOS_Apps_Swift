//
//  DoctorInfoView.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 19/06/2023.
//

import Foundation
import UIKit

class DoctorInfoView: UIView {
    
    
    @IBOutlet weak var doctorImage: UIImageView!
    
    @IBOutlet weak var doctorName: UILabel!
    
    @IBOutlet weak var doctorField: UILabel!
    
    var contentView: UIView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
}


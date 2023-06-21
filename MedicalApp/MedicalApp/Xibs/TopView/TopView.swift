//
//  TopView.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 07/06/2023.
//

import UIKit

class TopView: UIView {

    var contentView: UIView?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

}

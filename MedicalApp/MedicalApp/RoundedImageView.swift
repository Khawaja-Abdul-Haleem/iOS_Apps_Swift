//
//  RoundedImageView.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 07/06/2023.
//

import UIKit

class RoundedImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        assert(bounds.height == bounds.width, StringConstant.assertMessage)
        
        layer.cornerRadius = bounds.height / 2
    }
}

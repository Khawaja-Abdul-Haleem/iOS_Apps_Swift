//
//  SSHeader.swift
//  Orix-File-Manager
//
//  Created by Khawaja Abdul Haleem on 27/06/2023.
//

import UIKit

class SSHeader: UIView {
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var directoryLabel: UILabel!
    
    @IBOutlet weak var rightButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
}

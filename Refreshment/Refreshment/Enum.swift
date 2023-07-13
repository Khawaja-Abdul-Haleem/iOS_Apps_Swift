//
//  Enum.swift
//  Refreshment
//
//  Created by Khawaja Abdul Haleem on 06/07/2023.
//

import UIKit

enum ColorAsset: String {
    case ca_red
    
    static func appColor(name: ColorAsset) -> UIColor {
        UIColor(named: name.rawValue)!
    }
}

enum ItemSize{
    case smallSize, mediumSize, largeSize
}

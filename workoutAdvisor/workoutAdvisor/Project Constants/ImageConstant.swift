//
//  ImageConstant.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 11/07/2023.
//

import UIKit

class ImageConstant {
    
    static func getPlayIcon() -> UIImage {
        return UIImage(systemName: "play.fill")!
    }
    
    static func getPauseIcon() -> UIImage {
        return UIImage(systemName: "pause.fill")!
    }
    
    static func getThumbImage() -> UIImage {
        return UIImage(named: "sliderThumbImage")!
    }
}

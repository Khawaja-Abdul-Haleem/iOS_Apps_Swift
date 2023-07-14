//
//  HomeVcVm.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 12/07/2023.
//

import UIKit
import AVFoundation

class HomeVcVm {
    let videoURL = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
    let video = AVURLAsset(url: URL(fileURLWithPath: Bundle.main.path(forResource: "intro", ofType: "mp4")!))
    var videoThumbnail = UIImage()
    var videoTitle = ""
}

//
//  StringConstant.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 10/07/2023.
//

import UIKit
import AVFoundation

class StringConstant {
    
    static let SEGUE_TO_PLAYERVC = "goToPlayerVC"
    
    static func getVideoDuration(video: AVURLAsset) -> String{
        let asset = video
        let duration = asset.duration
        let seconds = CMTimeGetSeconds(duration)
        let secText = Int(seconds) % 60
        let minText = String(format: "%02d", Int(seconds) / 60)
        let videoDuration = "\(minText):\(secText) min"
        return videoDuration
    }
    
    static func getThumbNailFromAsset(video: AVURLAsset,completion: @escaping ((_ image: UIImage) -> Void)) {
        let thumbnailGenerator = AVAssetImageGenerator(asset: video)
        do
        {
            let cgImage = try thumbnailGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let UiImage = UIImage(cgImage: cgImage)
            completion(UiImage)
        }
        catch
        { print(error) }
    }
    
}

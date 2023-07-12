//
//  VideoPlayerView.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 08/07/2023.
//

import UIKit

class VideoPlayerView: UICollectionReusableView {
    
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDuration: UILabel!
    @IBOutlet weak var videoViews: UILabel!
    
    @IBOutlet weak var imageThumbnail: UIImageView!
    
    var delegate: VPViewProtocol? = nil
    
    @IBAction func shareBtnTapped(_ sender: UIButton) {}
    
    @IBAction func playBtnTapped(_ sender: UIButton) { delegate?.playBtnTapped() }
    
    @IBAction func favouriteBtnTapped(_ sender: UIButton) {}
}

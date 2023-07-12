//
//  PlayerView.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 07/07/2023.
//

import UIKit
import AVKit

class myVideoPlayer: UIView {
    @IBOutlet weak var vwPlayer: UIView!
    @IBOutlet weak var customVIew: UIView!
    
    @IBOutlet weak var mainPauseBtn: UIButton!
    @IBOutlet weak var innerPauseBtn: UIButton!
   
    var timer: Timer?
    var player: AVPlayer?
    var isPlaying = false
    var delegate: myVpProtocol? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    @IBAction func mainBtnTapped(_ sender: UIButton) {
        isPlaying ? player?.pause() : player?.play()
        innerPauseBtn.setImage(isPlaying ? ImageConstant.getPlayIcon() : ImageConstant.getPauseIcon(), for: .normal)
        isPlaying.toggle()
    }
    
    fileprivate func commonInit() {
        configureView()
        addPlayerToView(self.vwPlayer)
    }
    
    fileprivate func addPlayerToView(_ view: UIView) {
        player = AVPlayer()
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        view.addSubview(customVIew)

        NotificationCenter.default.addObserver(self, selector: #selector(playerEndPlay), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    func playVideoWithFileName(_ fileName: String, ofType type:String) {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: type) else { return }
        let videoURL = URL(fileURLWithPath: filePath)
        let playerItem = AVPlayerItem(url: videoURL)
        player?.replaceCurrentItem(with: playerItem)
        player?.play()
        player?.addObserver(self, forKeyPath: ProjectKeys.KEY_LOADED_TIME_RANGE.rawValue, options: .new, context: nil)
    }
    
    func seekValue(senderValue: Float) {
        
        if let duration = player?.currentItem?.duration {
            
            let totalSeconds = CMTimeGetSeconds(duration)
            let value = Float64(senderValue) * totalSeconds
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            
            player?.seek(to: seekTime, completionHandler: { (completedSeek) in
                self.isPlaying = true
                self.player?.play()
                self.innerPauseBtn.setImage(ImageConstant.getPauseIcon(), for: .normal)
            })
        }
    }
    
    func videoCurrentValue(completionHandler: @escaping (Float) -> Void) {
        var value: Float = Float()
        let interval = CMTime(value: 1, timescale: 2)
        player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { progressTime in
            let seconds = CMTimeGetSeconds(progressTime)
            if let duration = self.player?.currentItem?.duration {
                let durationSeconds = CMTimeGetSeconds(duration)
                value = Float(seconds / durationSeconds)
                
                self.timer?.invalidate()
                self.timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { time in
                    completionHandler(value)
                })
                
               
            }
        })
    }
   
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == ProjectKeys.KEY_LOADED_TIME_RANGE.rawValue {
            isPlaying = true
            delegate?.vpLoaded()
        }
    }
   
    func stopPlayer() {player?.pause()}
    
    @objc func playerEndPlay() {print("Player ends playing video")}
}

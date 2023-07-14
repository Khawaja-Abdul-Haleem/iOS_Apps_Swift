//
//  PlayerVC.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 08/07/2023.
//

import UIKit
import CoreMedia

class PlayerVC: UIViewController {
    
    @IBOutlet weak var navView: NavBar!
    @IBOutlet weak var vpView: myVideoPlayer! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
            vpView.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var videoSlider: UISlider! {
        didSet {videoSlider.setThumbImage(ImageConstant.getThumbImage(), for: .normal)}
    }
    
    @IBOutlet weak var videoThumbnail: UIImageView! {
        didSet {videoThumbnail.alpha = 0.45}
    }
    
    let viewModel = PlayerVcVM()
    var videoQualityView = VideoQualityView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        viewModel.isViewHidden ? vpView.customVIew.fadeIn() : vpView.customVIew.fadeOut()
        viewModel.isViewHidden ? videoSlider.fadeIn() : videoSlider.fadeOut()
        viewModel.isViewHidden.toggle()
    }
   
    @IBAction func sliderAction(_ sender: UISlider) { vpView.seekValue(senderValue: sender.value) }
    
    private func initialSetup() {
        videoQualityView.addInSuperView(view: view)
        vpView.delegate = self
        videoThumbnail.image = viewModel.image
        setupVideoPlayer()
    }
  
    private func setupNavView() {
        navView.delegate = self
        navView.titleLabel.text = viewModel.title
        navView.backButton.isHidden = true
        videoThumbnail.isHidden = true
        navView.titleLabel.isHidden = false
        navView.closedCaptionButton.isHidden = false
        navView.kebabMenuButton.isHidden = false
        navView.isHidden = false
        vpView.isHidden = false
    }
  
    private func setupVideoPlayer() {
        vpView.playVideoWithFileName("intro", ofType: "mp4")
        vpView.videoCurrentValue { value in
            DispatchQueue.main.async { self.videoSlider.value = value }
        }
    }
}

extension PlayerVC: myVpProtocol {
    func vpLoaded() { setupNavView() }
}

extension PlayerVC: VideoQualityProtocol {
    func cancelBtnTap() { videoQualityView.showOrHide() }
}

extension PlayerVC: NavBarProtocol {
    
    func menuBtnTapped() {
        videoQualityView.showOrHide()
    }
    
    func ccBtnTapped() {print("ccBtnTapped")}
    
    func backBtnTapped() {
        vpView.stopPlayer()
        navigationController?.popViewController(animated: true)
    }
}

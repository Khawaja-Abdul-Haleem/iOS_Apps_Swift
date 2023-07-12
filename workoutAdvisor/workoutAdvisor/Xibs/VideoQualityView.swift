//
//  VideoQualityView.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 11/07/2023.
//

import UIKit

class VideoQualityView: UIView {
    
    @IBOutlet weak var qualityViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var backgroundView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
            backgroundView.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var contentView: UIView! {
        didSet  { contentView.roundTop() }
    }
    
    var delegate: VideoQualityProtocol? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayout()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
 
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        showOrHide()
    }
    
    @IBAction func crossBtnTapped(_ sender: UIButton) {
        showOrHide()
    }

    private func configureLayout() {
        isHidden = true
        configureView()
    }
    
    func addInSuperView(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        NSLayoutConstraint.activate([
           topAnchor.constraint(equalTo: view.topAnchor),
           bottomAnchor.constraint(equalTo: view.bottomAnchor),
           leadingAnchor.constraint(equalTo: view.leadingAnchor),
           trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

// MARK: VideoQualityView
extension VideoQualityView {
    
    func showOrHide() {
        isHidden = false
        let isHidden = qualityViewBottomConstraint.constant < 0
        let animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
            self.qualityViewBottomConstraint.constant = isHidden ? 0 : (-1 * self.frame.height)
            self.backgroundView.alpha = isHidden ? 0.5 : 0
            self.layoutIfNeeded()
        }
        animator.startAnimation()
        animator.addCompletion { _ in
            if !isHidden { self.isHidden = true }
        }
    }
}

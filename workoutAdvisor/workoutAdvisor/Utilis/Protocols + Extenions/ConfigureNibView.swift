//
//  ConfigureNibView.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 07/07/2023.
//
import UIKit

public protocol ConfigureNibView {
    func configureView()
}

extension ConfigureNibView where Self: UIView {
    
    public func configureView() {
        guard let view = loadNibView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
    
}

extension UIView: ConfigureNibView { }



//
//  ConfigureNibView.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 20/06/2023.
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


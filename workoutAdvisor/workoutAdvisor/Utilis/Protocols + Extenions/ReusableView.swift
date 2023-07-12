//
//  ReusableView.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 07/07/2023.
//

import Foundation

@objc public protocol ReusableView { }

extension ReusableView {
    
    /// Represents a default reuse id. It is the class name as string.
    /// Usually (99.99% of the times) we register the cell once. So a unique name would be the reuse id.
    public static var ReuseId: String {
        String(describing: self)
    }
    
    /// Represents a default nib name. It is the class name as string.
    /// Usually (99.99% of the times) we name the nib as the class name.
    public static var NibName: String {
        String(describing: self)
    }
}

@objc public protocol ReusableCell: ReusableView { }

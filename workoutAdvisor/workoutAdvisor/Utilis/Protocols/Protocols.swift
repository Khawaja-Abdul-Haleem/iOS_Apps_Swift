//
//  Protocols.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 11/07/2023.
//

import UIKit

protocol NavBarProtocol {
    func backBtnTapped()
    func menuBtnTapped()
    func ccBtnTapped()
}

protocol myVpProtocol {
    func vpLoaded()
}

protocol VPViewProtocol {
    func shareBtnTapped()
    func playBtnTapped()
    func favBtnTapped()
}

protocol VideoQualityProtocol {
    func cancelBtnTap()
}

protocol ButtonCVCProtocol{
    func workoutBtnTapped()
}

//
//  SizeView.swift
//  Refreshment
//
//  Created by Khawaja Abdul Haleem on 06/07/2023.
//

import UIKit

protocol SizeViewProtocol {
    func selectedBtnTapped(size: ItemSize)
}

class SizeView: UIView {
    
    @IBOutlet weak var leftBg: UIImageView!
    @IBOutlet weak var rightBg: UIImageView!
    @IBOutlet weak var midBg: UIImageView!
    
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var midBtn: UIButton!
    
    var delegate: SizeViewProtocol? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    @IBAction func leftButtonTapped(_ sender: UIButton) {
        delegate?.selectedBtnTapped(size: .smallSize)
    }
    
    @IBAction func rightBtnTapped(_ sender: UIButton) {
        delegate?.selectedBtnTapped(size: .largeSize)
    }
    
    @IBAction func midBtnTapped(_ sender: UIButton) {
        delegate?.selectedBtnTapped(size: .mediumSize)
    }
    
    func changeButtonView(selectedBtn: UIButton) {
        leftBg.image = leftBtn == selectedBtn ? ImageConstant.getSelectedSize() : ImageConstant.getUnSelectedSize()
        rightBg.image = rightBtn == selectedBtn ? ImageConstant.getSelectedSize() : ImageConstant.getUnSelectedSize()
        midBg.image = midBtn == selectedBtn ? ImageConstant.getSelectedSize() : ImageConstant.getUnSelectedSize()
        
        setDefaultColor(selectedBtn: selectedBtn)
    }
    
    private func setDefaultColor(selectedBtn: UIButton) {
        leftBtn == selectedBtn ? (leftBtn.isSelected = true) : (leftBtn.isSelected = false)
        rightBtn == selectedBtn ? (rightBtn.isSelected = true) : (rightBtn.isSelected = false)
        midBtn == selectedBtn ? (midBtn.isSelected = true) : (midBtn.isSelected = false)
    }
}

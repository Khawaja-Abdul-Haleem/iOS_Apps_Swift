//
//  CategoryMenuCVC.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 09/06/2023.
//

import UIKit

protocol CategoryMenuCVCProtocol {
    func buttonTapped(indexPath: IndexPath)
}

class CategoryMenuCVC: UICollectionViewCell {
    
    @IBOutlet weak var categoryButton: UIButton!
    
    @IBOutlet weak var buttonView: RoundedView!
    var indexPath : IndexPath = IndexPath()
    var delegate: CategoryMenuCVCProtocol? = nil
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        delegate?.buttonTapped(indexPath: indexPath)
    }
    
}

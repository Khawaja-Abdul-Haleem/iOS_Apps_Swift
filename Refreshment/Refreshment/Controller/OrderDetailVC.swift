//
//  OrderDetailVC.swift
//  Refreshment
//
//  Created by Khawaja Abdul Haleem on 07/07/2023.
//

import UIKit

class OrderDetailVC: UIViewController {
    
    @IBOutlet weak var navView: NavBar!
    @IBOutlet weak var sizeView: SizeView!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var orderCount: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    
    var itemModel: ItemsModel?
    var count = 1
    var price = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    @IBAction func decrementBtnTapped(_ sender: UIButton) {
        if count > 1 {
            count -= 1
        }
        orderCount.text = String(describing: count)
        setPrice(price: price, count: Double(count))
    }
    
    @IBAction func incrementBtnTapped(_ sender: UIButton) {
        if count >= 1 {
            count += 1
        }
        orderCount.text = String(describing: count)
        setPrice(price: price, count: Double(count))
    }
    
    private func initialSetup() {
        sizeView.delegate = self
        sizeView.midBtn.isSelected = true
        setupNavBar()
        
        itemName.text = itemModel.defaultValue.name
        itemImage.image =  UIImage(named: itemModel.defaultValue.image)
        itemDescription.text = itemModel.defaultValue.name
        price = Double(itemModel.defaultValue.price) ?? 0
        setPrice(price: price, count: 1)
    }
    
    private func setPrice(price: Double, count: Double) { orderPrice.text = "$ \(String(describing: price * count))" }
    
    private func setupNavBar() {
        navView.delegate = self
        
        navView.locationView.isHidden = true
        navView.profileIcon.isHidden = true
        navView.likeView.isHidden = false
        navView.backView.isHidden = false
    }
}

extension OrderDetailVC: SizeViewProtocol {
    func selectedBtnTapped(size: ItemSize) {
        switch size {
        case .smallSize:
            sizeView.changeButtonView(selectedBtn: sizeView.leftBtn)
            price = Double(itemModel.defaultValue.smallPrice) ?? 0
            setPrice(price: price, count: Double(count))
            
        case .largeSize:
            sizeView.changeButtonView(selectedBtn: sizeView.rightBtn)
            price = Double(itemModel.defaultValue.largePrice) ?? 0
            setPrice(price: price, count: Double(count))
            
        default:
            sizeView.changeButtonView(selectedBtn: sizeView.midBtn)
            price = Double(itemModel.defaultValue.price) ?? 0
            setPrice(price: price, count: Double(count))
        }
    }
}

extension OrderDetailVC: NavBarProtocol {
    func backBtnTapped() { navigationController?.popViewController(animated: true) }
}

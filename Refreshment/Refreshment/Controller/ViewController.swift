//
//  ViewController.swift
//  Refreshment
//
//  Created by Khawaja Abdul Haleem on 05/07/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var itemCV: UICollectionView!
    
    @IBOutlet weak var popularItemTV: UITableView!
    
    @IBOutlet weak var navBar: NavBar!
    
    var allItems = [ItemsModel]()
    var selectedIndex: Int = 0
    var itemModel: ItemsModel?
    let segueIdentifier = "goToOrderDetailVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            if let nextViewController = segue.destination as? OrderDetailVC {
                nextViewController.itemModel = itemModel
            }
        }
    }
    
    private func initialSetup() {
        itemCV.registerNib(cell: ItemsCVC.self)
        popularItemTV.registerNib(cell: PopularItemsTVC.self)
        allItems = itemsModel
        navBar.delegate = self
    }
    
    @IBAction func searchFieldHandler(_ sender: UITextField) {
        if let searchtext = sender.text {
            allItems = searchtext.isEmpty ? itemsModel : itemsModel.filter{$0.name.lowercased().contains(searchtext.lowercased())}
            itemCV.reloadData()
        }
    }
}

extension ViewController: NavBarProtocol {
    func backBtnTapped() { }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { itemsModel.count }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 252 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PopularItemsTVC = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.itemName.text = itemsModel[indexPath.row].name
        cell.itemImage.image =  UIImage(named: itemsModel[indexPath.row].image)
        cell.itemDescription.text = itemsModel[indexPath.row].name
        cell.itemPrice.text = "$\(itemsModel[indexPath.row].price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemModel = itemsModel[indexPath.row]
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { allItems.count }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { CGSize(width: 100, height: 166) }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        itemCV.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ItemsCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        cell.itemImage.image =  UIImage(named: allItems[indexPath.row].image)
        cell.cellArrow.image = selectedIndex == indexPath.row ? ImageConstant.getSelectedArrow() : ImageConstant.getUnSelectedArrow()
        
        cell.itemName.text = allItems[indexPath.row].name
        cell.itemName.textColor = selectedIndex == indexPath.row ? .white : .black
        
        cell.cellView.backgroundColor = selectedIndex == indexPath.row ? ColorAsset.appColor(name: .ca_red) : .white
        
        return cell
    }
}

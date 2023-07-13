//
//  PopularItemsTVC.swift
//  Refreshment
//
//  Created by Khawaja Abdul Haleem on 07/07/2023.
//

import UIKit

class PopularItemsTVC: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
     @IBOutlet weak var itemDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

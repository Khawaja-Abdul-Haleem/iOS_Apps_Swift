//
//  FoldersTVC.swift
//  Orix-File-Manager
//
//  Created by Khawaja Abdul Haleem on 27/06/2023.
//

import UIKit

class FoldersTVC: UITableViewCell {

    
    @IBOutlet weak var folderImage: UIImageView!
    @IBOutlet weak var folderName: UILabel!
    
    @IBOutlet weak var folderDate: UILabel!
    
    @IBOutlet weak var folderDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

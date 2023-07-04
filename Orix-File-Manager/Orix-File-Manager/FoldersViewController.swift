//
//  FoldersViewController.swift
//  Orix-File-Manager
//
//  Created by Khawaja Abdul Haleem on 03/07/2023.
//

import UIKit

class FoldersViewController: UIViewController {

    @IBOutlet weak var navBar: NavBar!
    @IBOutlet weak var ssHeaderView: SSHeader!
    
    @IBOutlet weak var folderTableView: UITableView!
    
    var headerTitle = Constants.headerDefaultTitle
    var directory = Constants.defaultDirectory
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    private func initialSetup() {
        navBar.delegate = self
        folderTableView.registerNib(cell: FoldersTVC.self)
        
        navBar.leftButton.setImage(ImageConstant.getLeftArrow(), for: .normal)
        ssHeaderView.rightButton.setImage(ImageConstant.getEllipse(), for: .normal)
        
        ssHeaderView.headerTitle.text = headerTitle
        ssHeaderView.directoryLabel.isHidden = false
        ssHeaderView.directoryLabel.text = (ssHeaderView.directoryLabel.text ?? Constants.notFoundDirectory) + directory
    }
}

extension FoldersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFolderModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FoldersTVC = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let detail = Constants.getFolderStorage(documentsPath: documentsPath)
        
        cell.folderImage.image = ImageConstant.getFolderIcon()
        cell.folderName.text = myFolderModel[indexPath.row].folderName
        cell.folderDate.text = myFolderModel[indexPath.row].folderDate
        cell.folderDetails.text = detail
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension FoldersViewController: NavBarProtocol {
    // used as backButton
    func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

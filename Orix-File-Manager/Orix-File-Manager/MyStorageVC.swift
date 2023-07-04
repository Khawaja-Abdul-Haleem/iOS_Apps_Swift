//
//  MyStorageVC.swift
//  Orix-File-Manager
//
//  Created by Khawaja Abdul Haleem on 27/06/2023.
//

import UIKit

class MyStorageVC: UIViewController {

    @IBOutlet weak var navBar: NavBar!
    @IBOutlet weak var storageView: UIView!
    
    @IBOutlet weak var totalUsedLabel: UILabel!
    @IBOutlet weak var cardViewTitle: UILabel!
    
    @IBOutlet weak var FoldersTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SEGUE_GOTO_FVC {
            if let nextViewController = segue.destination as? FoldersViewController {
                nextViewController.headerTitle = cardViewTitle.text ?? Constants.notFoundTitle
                nextViewController.directory = Constants.orixDirectory
            }
        }
    }
    
    @IBAction func orixBtnTapped(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.SEGUE_GOTO_FVC, sender: nil)
    }
    
    private func initialSetup() {
        navBar.delegate = self
        FoldersTV.registerNib(cell: FoldersTVC.self)
        
        storageView.showCircle(free: Constants.getStoragePercentage(type: .free), used: Constants.getStoragePercentage(type: .used), width: 8.0, radius: 4)
        
        navBar.leftButton.setImage(ImageConstant.getLeftArrow(), for: .normal)
        totalUsedLabel.text = "\(UIDevice.current.usedDiskSpaceInGB) / \(UIDevice.current.totalDiskSpaceInGB)"
    }
}

extension MyStorageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFolderModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FoldersTVC = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.folderImage.image =  UIImage(named: myFolderModel[indexPath.row].folderImage)
        cell.folderName.text = myFolderModel[indexPath.row].folderName
        cell.folderDate.text = myFolderModel[indexPath.row].folderDate
        cell.folderDetails.text = myFolderModel[indexPath.row].folderDetail
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}

extension MyStorageVC: NavBarProtocol {
    // used as backController
    func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

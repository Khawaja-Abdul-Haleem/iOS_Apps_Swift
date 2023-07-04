//
//  ViewController.swift
//  Orix-File-Manager
//
//  Created by Khawaja Abdul Haleem on 26/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalMemory: UILabel!
    @IBOutlet weak var usedMemory: UILabel!
    
    @IBOutlet weak var navBar: NavBar!
    @IBOutlet weak var storageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    private func initialSetup() {
         navBar.delegate = self
    
        totalMemory.text = UIDevice.current.totalDiskSpaceInGB
         usedMemory.text = Constants.getUsedStorage()
         
        storageView.showCircle(free: Constants.getStoragePercentage(type: .free), used: Constants.getStoragePercentage(type: .used), width: 30.0, radius: 2)
    }
}

extension ViewController: NavBarProtocol {
    // used as menuBar
    func leftButtonTapped() {
        print("menuButtonTapped")
    }
}


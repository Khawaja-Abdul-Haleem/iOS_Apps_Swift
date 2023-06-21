//
//  AllDoctorViewController.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 09/06/2023.
//

import UIKit

class AllDoctorViewController: UIViewController {
    
    @IBOutlet weak var customNavBarView: CustomNavBar!
    
    @IBOutlet weak var allDoctorMenuCV: UICollectionView!
    
    @IBOutlet weak var allDoctorsCV: UICollectionView!
    
    var currentSelected: Int = 0
    var searchCategory: String = ""
    var index: Int = 0
    var AllDoctors = [PopularDoctorModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        customNavBarView.delegate = self
        setCollectionView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueConstant.SEGUE_TO_DOCTOR_DETAILVC {
            if let nextViewController = segue.destination as? DoctorDetailViewController {
                nextViewController.doctor =  AllDoctors[index] 
            }
        }
    }
    
    private func setCollectionView() {
       
        allDoctorsCV.registerNib(cell: AllDoctorsCVCell.self)
        
        self.AllDoctors = popularDoctors
        self.searchCategory = doctors[currentSelected].category
        AllDoctors = searchCategory.isEmpty ? popularDoctors : popularDoctors.filter{$0.doctorField.lowercased().contains(searchCategory.lowercased())}
    }
    
}

extension AllDoctorViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == allDoctorMenuCV {
            return doctors.count
        } else {
            return AllDoctors.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == allDoctorMenuCV {
            return CGSize(width: 180, height: 35)
        } else {
            return CGSize(width: 180, height: 244)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == allDoctorMenuCV {
            return 16
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == allDoctorMenuCV {
            let cell = allDoctorMenuCV.dequeueReusableCell(withReuseIdentifier: IdentifierConstant.CATEGORY_MENUVC_IDENTIFIER, for: indexPath) as! CategoryMenuCVC
            cell.indexPath = indexPath
            cell.categoryButton.setTitle(doctors[indexPath.row].doctorField, for: .normal)
            cell.categoryButton.titleLabel?.numberOfLines = 1
            
            cell.buttonView.backgroundColor = currentSelected == indexPath.row ? ColorConstant.lighBlueColor : ColorConstant.blueColor
            
            cell.delegate = self
            
            return cell
        } else {
            let cell: AllDoctorsCVCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            cell.docImage.image =  UIImage(named: AllDoctors[indexPath.row].image)
            cell.docName.text = AllDoctors[indexPath.row].doctorName
            cell.drField.text = AllDoctors[indexPath.row].doctorField
            cell.drPlace.text = AllDoctors[indexPath.row].doctorArea
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.index = indexPath.row
        performSegue(withIdentifier: SegueConstant.SEGUE_TO_DOCTOR_DETAILVC, sender: nil)
    }
    
}

extension AllDoctorViewController: CategoryMenuCVCProtocol {
    func buttonTapped(indexPath: IndexPath) {
        currentSelected = indexPath.row
        allDoctorMenuCV.reloadData()
        searchCategory = doctors[currentSelected].category
        
        AllDoctors = searchCategory.isEmpty ? popularDoctors : popularDoctors.filter{$0.doctorField.lowercased().contains(searchCategory.lowercased())}
        allDoctorsCV.reloadData()
    }
    
    
}

extension AllDoctorViewController: CustomNavBarProtocol {
    func backButtontapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

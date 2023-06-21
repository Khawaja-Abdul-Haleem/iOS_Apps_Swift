//
//  ViewController.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 07/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var doctorCollectionView: UICollectionView!
    @IBOutlet weak var searchField: UITextField! {
        didSet {
            let color = ColorConstant.blueColor
            searchField.layer.cornerRadius = 20.0
            searchField.layer.borderWidth = 2.0
            searchField.layer.borderColor = color.cgColor
            
            searchField.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var popularDoctorCollectionVIew: UICollectionView!
    
    
    @IBOutlet weak var HealthCareCollectionVIew: UICollectionView!
    
    
    var AllDoctors = [PopularDoctorModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        setCollectionView()
        
        
    }
    
    // MARK:  Search Handler
    @IBAction func searchFieldHandler(_ sender: UITextField) {
        if let searchtext = sender.text {
           
            AllDoctors = searchtext.isEmpty ? popularDoctors : popularDoctors.filter{$0.doctorName.lowercased().contains(searchtext.lowercased())}
            popularDoctorCollectionVIew.reloadData()
        }
    }
    
    
    @IBAction func seeAllDoctorsButtonTap(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConstant.SEGUE_TO_ALL_DOCTORVC, sender: nil)
    }
    
    private func setCollectionView() {
        doctorCollectionView.registerNib(cell: DoctorCVC.self)
        HealthCareCollectionVIew.registerNib(cell: DoctorCVC.self)
        popularDoctorCollectionVIew.registerNib(cell: PopularDoctorCVC.self)
        
         self.AllDoctors = popularDoctors
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == HealthCareCollectionVIew {
            return healthCares.count
        } else if collectionView == popularDoctorCollectionVIew {
           return AllDoctors.count
        } else {
            return doctors.count
        }
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == doctorCollectionView || collectionView == HealthCareCollectionVIew {
            return CGSize(width: 200, height: 125.0)
        } else {
            return CGSize(width: 150, height: 255)
        }
        
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == doctorCollectionView {
            let cell: DoctorCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
           
            cell.fieldImage.image =  UIImage(named: doctors[indexPath.row].image)
            cell.doctorField.text = doctors[indexPath.row].doctorField
            cell.totalDoctor.text = "\(doctors[indexPath.row].totalDoctor) \(StringConstant.doctorConcate)"
            
            return cell
        } else if collectionView == HealthCareCollectionVIew {
            
            let cell: DoctorCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            
            cell.fieldImage.image =  UIImage(named: healthCares[indexPath.row].image)
            cell.totalDoctor.text =  "24/7"
            cell.doctorField.text = healthCares[indexPath.row].activity
            return cell
        } else {
            let cell: PopularDoctorCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            
            cell.doctorImage.image =  UIImage(named: AllDoctors[indexPath.row].image)
            cell.drName.text = AllDoctors[indexPath.row].doctorName
            cell.drField.text = AllDoctors[indexPath.row].doctorField
            cell.drPlace.text = AllDoctors[indexPath.row].doctorArea
            cell.bgView.backgroundColor = AllDoctors[indexPath.row].color
            return cell
        }
        
    }
   
    
}

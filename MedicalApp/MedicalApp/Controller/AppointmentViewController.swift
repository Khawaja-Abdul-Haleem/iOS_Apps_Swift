//
//  AppointmentViewController.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 19/06/2023.
//

import UIKit

class AppointmentViewController: UIViewController {
    
    @IBOutlet weak var customNavBar: CustomNavBar!
    
    @IBOutlet weak var doctorInforVIew: DoctorInfoView!
    
    @IBOutlet weak var appointmentCollectionView: UICollectionView!
    
    var name = ""
    var field = ""
    var image = ""
    
    var workingHr = ""
    var schedule = ""
    var gender = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initalSetup()
        
    }
    
    
    @IBAction func bookNowBtnTapped(_ sender: UIButton) {
        if workingHr != "" && schedule != "" && gender != "" {
            
            let alert = UIAlertController(title: StringConstant.alertTitle, message: StringConstant.alertMessage, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.workingHr = ""
                self.schedule = ""
                self.gender = ""
                self.appointmentCollectionView.reloadData()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func initalSetup() {
        setUIViews()
        configureCollectionView()
    }
    
    private func setUIViews() {
        customNavBar.navTitle.text = StringConstant.appointmentVCNavTitle
        doctorInforVIew.doctorName.text = name
        doctorInforVIew.doctorField.text = field
        doctorInforVIew.doctorImage.image =  UIImage(named: image)
        customNavBar.delegate = self
    }
    
    private func configureCollectionView() {
      
        appointmentCollectionView.collectionViewLayout = createCompositionalLayout()
        
        appointmentCollectionView.registerNib(cell: TitleCVC.self)
        appointmentCollectionView.registerNib(cell: ScheduleCVC.self)
        appointmentCollectionView.registerNib(cell: GenderCVC.self)
        appointmentCollectionView.registerNib(cell: WorkingHourCVC.self)
        
     
    }
}

extension AppointmentViewController: UICollectionViewDelegateFlowLayout {
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnv: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            if sectionIndex == 3 {
                return self.compositionalLayoutVertical(scrollingType: .horizontal)
            } else if sectionIndex == 5 {
                return self.compositionalLayoutVertical(scrollingType: .normal)
            } else {
                return self.compositionalLayoutVertical(scrollingType: .vertical)
            }
          
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 0
        layout.configuration = config
        return layout
    }
    
    private func compositionalLayoutVertical(scrollingType: ScrollingType) -> NSCollectionLayoutSection {
        let inset: CGFloat = 8
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(scrollingType.width),
                                             heightDimension: .estimated(44))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = .init(leading: .fixed(0), top: .fixed(inset), trailing: .fixed(inset), bottom: .fixed(inset))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(44))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                     subitems: [item])
        group.edgeSpacing = .none
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = scrollingType.orthogonalScrollingBehavior
        return section
    }

}

extension AppointmentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        appointments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch appointments[section] {
        case .title:
            return 1
        case .workingHours(let data), .schedules(let data):
            return data.count
        case .gender(let data):
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapp")
        
        switch appointments[indexPath.section] {
     
        case .title(let title):
            print(title)
        
        case .workingHours(let data):
            print(data[indexPath.row])
            workingHr = data[indexPath.row]
            
        case .schedules(let data):
            print(data[indexPath.item])
            schedule = data[indexPath.item]
            
        case .gender(let data):
            print(data[indexPath.item])
            gender = data[indexPath.item].title

        }
        appointmentCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        switch appointments[indexPath.section] {
        case .title(let title):
            print(title)
            
            let titleCell: TitleCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            titleCell.titleLabel.text = title
        
            return titleCell
            
        case .workingHours(let data):
            print(data[indexPath.item])
            
            let workingHourCell: WorkingHourCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            workingHourCell.workingHour.text = data[indexPath.item]
            
            if workingHr == data[indexPath.item] {
                workingHourCell.mainView.backgroundColor = ColorConstant.lighBlueColor
            } else {
                workingHourCell.mainView.backgroundColor = .clear
            }
            
            return workingHourCell
            
        case .schedules(let data):
            print(data[indexPath.item])
            
            let scheduleCell: ScheduleCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            
            scheduleCell.dateLabel.text = data[indexPath.item]
            
            if schedule == data[indexPath.item] {
                scheduleCell.mainView.backgroundColor = ColorConstant.lighBlueColor
            } else {
                scheduleCell.mainView.backgroundColor = .clear
            }
            
            return scheduleCell
            
        case .gender(let data):
            print(data[indexPath.item])
            let cell2: GenderCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            cell2.genderLabel.text = data[indexPath.item].title

            if gender == data[indexPath.item].title {
                cell2.mainView.backgroundColor = ColorConstant.lighBlueColor
            } else {
                cell2.mainView.backgroundColor = .clear
            }
            
            return cell2
        }
       
    }
    
    
}

extension AppointmentViewController: CustomNavBarProtocol {
    func backButtontapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

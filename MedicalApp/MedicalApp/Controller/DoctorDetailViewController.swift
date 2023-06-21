//
//  DoctorDetailViewController.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 12/06/2023.
//

import UIKit
import ReadMoreTextView

class DoctorDetailViewController: UIViewController {
    
    @IBOutlet weak var callButton: UIButton!
    
    @IBOutlet weak var customNavBar: CustomNavBar!
    
    @IBOutlet weak var descriptionTextView: ReadMoreTextView!
    
    @IBOutlet weak var doctorImage: UIImageView!
    
    @IBOutlet weak var doctorName: UILabel!
    
    @IBOutlet weak var doctorField: UILabel!
    
    var doctor: PopularDoctorModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    private func initialSetup() {
        customNavBar.navTitle.isHidden = true
        customNavBar.delegate = self
        descriptionTextView.addReadButton()
        
        doctorImage.image =  UIImage(named: doctor?.image ?? "")
        doctorName.text = doctor?.doctorName ?? StringConstant.noNameFound
        doctorField.text = doctor?.doctorField ?? StringConstant.noFieldFound
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueConstant.SEGUE_GOTO_APPOINTMENTVC {
            if let nextViewController = segue.destination as? AppointmentViewController {
                nextViewController.name =  doctor?.doctorName ?? StringConstant.noNameFound
                nextViewController.field = doctor?.doctorField ?? StringConstant.noFieldFound
                nextViewController.image = doctor?.image ?? StringConstant.noImageFound
            }
        }
    }
    
    @IBAction func appointmentButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: SegueConstant.SEGUE_GOTO_APPOINTMENTVC, sender: nil)
    }
    
    
}

extension DoctorDetailViewController: CustomNavBarProtocol {
    func backButtontapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

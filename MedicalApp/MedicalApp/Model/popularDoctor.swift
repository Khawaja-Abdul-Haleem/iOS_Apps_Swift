//
//  popularDoctor.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 08/06/2023.
//

import Foundation
import UIKit

struct PopularDoctorModel {
    var image: String
    var doctorName: String
    var doctorField: String
    var doctorArea: String
    var color: UIColor
}

var popularDoctors = [
    PopularDoctorModel(image: "sumaira", doctorName: "Dr.Sumaira Sumi", doctorField: "Medicine", doctorArea: "Rangpur Medical College", color: ColorConstant.lightOrangeColor),
    PopularDoctorModel(image: "masruk", doctorName: "Dr.Masruk Farhan", doctorField: "Cardiology", doctorArea: "Rangpur Medical College", color: ColorConstant.lightPurpleColor),
    PopularDoctorModel(image: "sumitra", doctorName: "Dr.Soumitra Deb", doctorField: "Dentist", doctorArea: "Rangpur Medical College", color: ColorConstant.lightOliveGreenColor),
    PopularDoctorModel(image: "usman", doctorName: "Dr.Usman Yousaf", doctorField: "Cardiology", doctorArea: "Rangpur Medical College", color: ColorConstant.lightPurpleColor),
    PopularDoctorModel(image: "sonalika", doctorName: "Dr.Sonalika Sen", doctorField: "Medicine", doctorArea: "Rangpur Medical College", color: ColorConstant.lightOrangeColor)
    
]


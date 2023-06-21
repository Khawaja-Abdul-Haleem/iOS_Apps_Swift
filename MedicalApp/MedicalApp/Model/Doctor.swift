//
//  Doctor.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 07/06/2023.
//

import Foundation

struct DoctorModel {
    var image: String
    var totalDoctor: Int
    var doctorField: String
    var category: String
}

var doctors = [
    DoctorModel(image: "drugs", totalDoctor: 10, doctorField: "Medicine Specialist", category: "Medicine"),
    DoctorModel(image: "cardiology", totalDoctor: 25, doctorField: "Cardiologist", category: "Cardiology"),
    DoctorModel(image: "teeth", totalDoctor: 15, doctorField: "Dentist", category: "Dentist"),
    DoctorModel(image: "dermatology", totalDoctor: 5, doctorField: "Dermatologists", category: "Dermatology"),
    DoctorModel(image: "endocrinology", totalDoctor: 5, doctorField: "Endocrinologists", category: "Endocrinology")
]

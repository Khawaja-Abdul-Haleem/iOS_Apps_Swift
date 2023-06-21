//
//  healthCareModel.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 08/06/2023.
//

import Foundation

struct healthCareModel {
    var image: String
    var activity: String
    
}

var healthCares = [
    
    healthCareModel(image: "drugRoutine", activity: "Drug Routine"),
    healthCareModel(image: "drugs", activity: "Buy Medicine"),
    healthCareModel(image: "ambulance", activity: "Get Ambulance"),
    healthCareModel(image: "laboratory", activity: "Visit Laboratory")
    
]

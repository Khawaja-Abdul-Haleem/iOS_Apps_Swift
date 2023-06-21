//
//  Enums.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 19/06/2023.
//

import UIKit

enum Appointment {
  case title(String)
  case workingHours([String])
  case schedules([String])
  case gender([(title: String, selected: Bool)])
}

enum ScrollingType: String {
    case vertical = "verticalScroll"
    case horizontal = "horizontalScroll"
    case normal = "normalScrolling"
    
    var width: CGFloat {
        switch self {
        case .vertical:
            return 150
        case .horizontal:
            return 47
        case .normal:
            return 80
        }
    }
    
    var orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior {
        switch self {
        case .vertical:
            return .none
        default:
            return .groupPaging
        }
    }
}

let appointments: [Appointment] = [
  .title("Working Hours"),
  .workingHours(["11:00 AM", "12:00 PM", "01:00 AM", "03:00 PM", "04:00 PM"]),
  .title("Schedules"),
  .schedules(["Sun 10", "Mon 11", "Tue 12", "Wed 13", "Thur 14", "Fri 15", "Sat 16", "Sun 17", "Mon 18", "Tue 19", "Wed 20"]),
  .title("Appointment For"),
  .gender([(title: "Male", selected: true), (title: "Female", selected: false), (title: "Other", selected: false)]),
  
]

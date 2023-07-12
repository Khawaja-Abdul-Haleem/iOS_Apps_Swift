//
//  Enums.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 10/07/2023.
//

import UIKit

enum ProjectKeys: String {
    case KEY_LOADED_TIME_RANGE = "currentItem.loadedTimeRanges"
}

enum ScrollingType: String {
    case vertical = "verticalScroll"
    case normal = "normalScrolling"
    
    var width: CGFloat {
        switch self {
        case .vertical:
            return 100
        default:
            return 300
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

enum VideoCollection {
    case tags([String])
    case description(String)
    case button(String)
    case title(String)
    case videos([(title: String, duration: String, image: String)])
   
}

let videoCollection: [VideoCollection] = [
    .tags(["Boxing", "Cardio", "Olivia Cooney", "Intermediate", "0-10min", "Easy Video"]),
    .description("In this course I will take you through the process of becoming a fitness expert step by step. You will learn everything you need to know about the fundamentals of good training programs and how to design your very own for you or your clients."),
    .button("Checkworkout"),
    .title("Trending"),
    .videos([(title: "video1", duration: "5", image: ""), (title: "video2", duration: "5", image: ""), (title: "video3", duration: "5", image: ""), (title: "video4", duration: "5", image: "")])
]


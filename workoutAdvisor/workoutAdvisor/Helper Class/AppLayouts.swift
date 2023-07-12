//
//  AppLayouts.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 10/07/2023.
//

import Foundation
import UIKit
class AppLayouts {
    
    static let shared = AppLayouts()
    
    func trendingVideosSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(170), heightDimension: .absolute(260)), subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 60, trailing: -10)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    func compositionalLayoutVertical(scrollingType: ScrollingType) -> NSCollectionLayoutSection {
        let inset: CGFloat = 0
        
        let itemSize = NSCollectionLayoutSize(widthDimension: scrollingType == .normal ? .fractionalWidth(1.0) : .estimated(scrollingType.width),
                                              heightDimension: .estimated(44))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = .init(leading: .fixed(-5), top: .fixed(inset), trailing: .fixed(0), bottom: .fixed(inset))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(44))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.edgeSpacing = .none
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = scrollingType.orthogonalScrollingBehavior
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        if scrollingType == .vertical { section.boundarySupplementaryItems = [headerElement] }
        
        return section
    }
    
    
}

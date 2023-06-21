//
//  CustomTabBarController.swift
//  MedicalApp
//
//  Created by Khawaja Abdul Haleem on 08/06/2023.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let spacing: CGFloat = 12

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.delegate = self
        
        changeTabBarItemSpace()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.addTabbarIndicatorView(index: 0, isFirstTime: true)
        }
    }
    
    func changeTabBarItemSpace() {
       
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 5)

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
   
    
    ///Add tabbar item indicator uper line
    func addTabbarIndicatorView(index: Int, isFirstTime: Bool = false){
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
            return
        }

    }
    
    

}

extension CustomTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabbarIndicatorView(index: self.selectedIndex)
    }
}


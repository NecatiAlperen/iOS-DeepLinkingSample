//
//  TabbarController.swift
//  ios-DeepLinkingSample
//
//  Created by Necati Alperen IŞIK on 1.08.2024.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    private func setupTabbar() {
        tabBar.backgroundColor = .systemGray3
        
        let homeViewController = MoviesViewController()
        let settingsViewController = SettingsViewController()
        
        let vcFirst = UINavigationController(rootViewController: homeViewController)
        let vcSecond = UINavigationController(rootViewController: settingsViewController)
        
        vcFirst.tabBarItem.image = UIImage(systemName: "movieclapper")
        vcSecond.tabBarItem.image = UIImage(systemName: "gearshape")
        vcFirst.tabBarItem.title = "Movies"
        vcSecond.tabBarItem.title = "Settings"

        tabBar.tintColor = .label
        setViewControllers([vcFirst, vcSecond], animated: true)
    }
}

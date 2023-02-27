//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        sonfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func sonfigure() {
        
        // MARK: - Appearance
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        // MARK: - Controllers
        let overviewController = OverviewViewController()
        let sessionController = SessionViewController()
        let progressController = ProgressViewController()
        let settingsController = SettingsViewController()
        
        let overviewNavigationaController = NavBarController(rootViewController: overviewController)
        let sessionNavigationaController = NavBarController(rootViewController: sessionController)
        let progressNavigationaController = NavBarController(rootViewController: progressController)
        let settingsNavigationaController = NavBarController(rootViewController: settingsController)
        
        // MARK: - Bar items
        overviewNavigationaController.tabBarItem = UITabBarItem(title: Resources.Strings.Tbbar.overview,
                                                     image: Resources.Images.overview,
                                                     tag: Tabs.overview.rawValue)
        sessionNavigationaController.tabBarItem = UITabBarItem(title: Resources.Strings.Tbbar.session,
                                                     image: Resources.Images.session,
                                                     tag: Tabs.session.rawValue)
        progressNavigationaController.tabBarItem = UITabBarItem(title: Resources.Strings.Tbbar.progress,
                                                     image: Resources.Images.progress,
                                                     tag: Tabs.progress.rawValue)
        settingsNavigationaController.tabBarItem = UITabBarItem(title: Resources.Strings.Tbbar.settings,
                                                     image: Resources.Images.settings,
                                                     tag: Tabs.settings.rawValue)
        
        setViewControllers([overviewNavigationaController,
                            sessionNavigationaController,
                            progressNavigationaController,
                            settingsNavigationaController],
                           animated: false)
        
        
    }
    
}

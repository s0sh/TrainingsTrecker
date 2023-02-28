//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: Resources.Colors.titleDarkGrey,
                                                                .font: Resources.Fonts.helveticaRegular(with: 17.0)]
        navigationBar.addButtomBorder(with: Resources.Colors.separator,
                                      height: 1)
        
    }
}


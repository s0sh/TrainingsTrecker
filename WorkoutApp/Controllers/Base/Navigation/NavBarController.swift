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
        navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: R.Colors.titleDarkGrey,
                                                                .font: R.Fonts.helveticaRegular(with: 17.0)]
        navigationBar.addButtomBorder(with: R.Colors.separator,
                                      height: 1)
        
    }
}


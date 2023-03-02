//
//  OverviewControllerViewController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

final class OverviewViewController: BaseController {
    private let navBar = OverviewNavbar()
}

extension OverviewViewController {
    override func setupViews() {
       super.setupViews()
        view.addView(navBar)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    override func configure() {
        super.configure()
        navigationController?.navigationBar.isHidden = true
    }
    
}

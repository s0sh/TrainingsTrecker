//
//  SessionViewController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

class SessionViewController: BaseController {
    private let timerView: WABaseInfoView = {
        let view = WABaseInfoView(with: "test", buttonTitle: "Test Button".uppercased())
        
        return view
    }()
}

extension SessionViewController {
    
    override func setupViews() {
        super.setupViews()
        view.setupView(timerView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configure() {
        super.configure()
        title = R.Strings.NavBar.Title.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        addNavBarButton(at: .left, with: R.Strings.SessionButton.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.SessionButton.navBarRight)
        
    }
}

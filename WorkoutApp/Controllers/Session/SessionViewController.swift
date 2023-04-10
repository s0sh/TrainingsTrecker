//
//  SessionViewController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

class SessionViewController: BaseController {
    private let timerView = TimerView()
    private let timerDuration = 3.0
    
    override func navBarLeftButtonHandler() {
        super.navBarLeftButtonHandler()
        
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        
        setTitleNavBarButton(timerView.state == .isRunning ?
                             R.Strings.SessionButton.navBarPaused : R.Strings.SessionButton.navBarStart,
                             at: .left)
    }
    
    override func navBarRightButtonHandler() {
        super.navBarRightButtonHandler()
        timerView.stopTimer()
        timerView.state = .isStopped
        setTitleNavBarButton(R.Strings.SessionButton.navBarStart, at: .left)
    }
}

extension SessionViewController {
    
    override func setupViews() {
        super.setupViews()
        view.setupView(timerView)
        setTitleNavBarButton("Start", at: .left)
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
        addNavBarButton(at: .left, with: R.Strings.SessionButton.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.SessionButton.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 1.5)
    }
}

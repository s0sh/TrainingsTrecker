//
//  SessionViewController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

class SessionViewController: BaseController {
    private let timerView = TimerView()
    private let timerDuration = 30.0
    
    private let statsView = StatsView(with: R.Strings.Session.Stats.workoutStats)
    private let stepsView = StepsView(with: R.Strings.Session.Stats.stepsCounter)
    
    override func navBarLeftButtonHandler() {
        super.navBarLeftButtonHandler()
        
        if timerView.state == .isStopped {
            timerView.startTimer { [weak self] in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self?.navBarRightButtonHandler()
                })
            }
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        
        setTitleNavBarButton(timerView.state == .isRunning ?
                             R.Strings.Session.navBarPaused :
                             R.Strings.Session.navBarStart,
                             at: .left)
    }
    
    override func navBarRightButtonHandler() {
        super.navBarRightButtonHandler()
        timerView.stopTimer()
        timerView.state = .isStopped
        setTitleNavBarButton(R.Strings.Session.navBarStart, at: .left)
    }
}

extension SessionViewController {
    
    override func setupViews() {
        super.setupViews()
        view.setupView(timerView)
        
        view.setupView(statsView)
        view.setupView(stepsView)
        
        setTitleNavBarButton(R.Strings.Session.navBarStart, at: .left)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
           
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor)
            
        ])
    }
    
    override func configure() {
        super.configure()
        title = R.Strings.NavBar.Title.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0.0)
        
        statsView.configure(with: [.heartRate(value: "155"),
                                   .averagePace(value: "8'20''"),
                                   .totalSteps(value: "7,682"),
                                   .totalDistance(value: "8.25")])
        
        stepsView.configure(with: [.init(value: "8k", heightParam: 1, title: "2/14"),
                                   .init(value: "7k", heightParam: 0.8, title: "2/15"),
                                   .init(value: "5k", heightParam: 0.6, title: "2/16"),
                                   .init(value: "6k", heightParam: 0.7, title: "2/17")])
        
    }
}

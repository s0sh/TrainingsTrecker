//
//  ProgressViewController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

class ProgressViewController: WABaseController {

    private let dailyPerformanceView = DailyPerformanceView(with: R.Strings.ProgressButton.dailyPerformance,
                                                            buttonTitle: R.Strings.ProgressButton.lastSevenDays)
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension ProgressViewController {
    override func setupViews() {
        super.setupViews()
        view.setupView(dailyPerformanceView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        title = R.Strings.NavBar.Title.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .progress)
        addNavBarButton(at: .left, with: R.Strings.ProgressButton.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.ProgressButton.navBarRight)
        
        dailyPerformanceView.configure(with: [.init(value: "1", heightParam: 0.1, title: "MON"),
                                   .init(value: "2", heightParam: 0.2, title: "TUE"),
                                   .init(value: "3", heightParam: 0.4, title: "WED"),
                                   .init(value: "4", heightParam: 0.6, title: "thu"),
                                   .init(value: "5", heightParam: 1, title: "FRI"),
                                   .init(value: "3", heightParam: 0.4, title: "SAT"),
                                   .init(value: "2", heightParam: 0.2, title: "SUN")])
        
    }
}

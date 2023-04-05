//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 06.03.2023.
//

import UIKit

final class TimerView: WABaseInfoView {
    private let progressView: ProgressView = {
       let progress = ProgressView()
        progress.draawProgress(with: 0.0)
       return progress
    }()
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        addView(progressView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}

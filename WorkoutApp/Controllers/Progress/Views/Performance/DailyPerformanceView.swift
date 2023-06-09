//
//  DailyPerformanceView.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 09.06.2023.
//

import UIKit

final class DailyPerformanceView: WABaseInfoView {
    private let barsView = WABarsView()
    
    func configure(with items: [WABarView.BarData]) {
        barsView.configure(with: items)
    }
}

extension DailyPerformanceView {
    override func setupViews() {
        super.setupViews()
        setupView(barsView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}


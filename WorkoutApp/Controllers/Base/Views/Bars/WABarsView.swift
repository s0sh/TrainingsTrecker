//
//  WABarView.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 22.04.2023.
//

import UIKit

final class WABarsView: WABaseView {
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(with data: [WABarView.BarData]) {
        data.forEach {
            let view = WABarView(data: $0)
            self.stackView.addArrangedSubview(view)
        }
    }
}

extension WABarsView {
    override func setupViews() {
        super.setupViews()
        addView(stackView)
        
    }
    
    override func constraintViews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}


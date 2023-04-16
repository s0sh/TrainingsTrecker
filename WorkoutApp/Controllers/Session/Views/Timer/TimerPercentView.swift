//
//  TimerPercentView.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 16.04.2023.
//

import UIKit

extension TimerView {
    final class PercentView: BaseView {
        private var percentLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 23)
            label.textColor = R.Colors.titleDarkGrey
            label.textAlignment = .center
            return label
        }()
        
        private var subTitleLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 10)
            label.textColor = R.Colors.inactive
            label.textAlignment = .center
            return label
        }()
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
    }
}

extension TimerView.PercentView {
    override func setupViews() {
        super.setupViews()
        addView(stackView)
        stackView.addArrangedSubview(percentLabel)
        stackView.addArrangedSubview(subTitleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    func configure(eith title: String, andValue value: Int) {
        subTitleLabel.text = title
        percentLabel.text = "\(value)%"
    }
}

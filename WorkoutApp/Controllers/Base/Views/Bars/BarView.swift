//
//  BarView.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 22.04.2023.
//

import UIKit

final class WABarView: WABaseView {
    
    private let heightMultiplier: Double
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.active
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.active
        view.layer.cornerRadius = 2.5
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 9)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    init(data: BarData) {
        self.heightMultiplier = data.heightParam
        super.init(frame: .zero)
        titleLabel.text = data.title
        valueLabel.text = data.value
    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplier = 0
        super.init(frame: .zero)
    }
}

extension WABarView {
    override func setupViews() {
        super.setupViews()
        addView(valueLabel)
        addView(barView)
        addView(titleLabel)
        
    }
    
    override func constraintViews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier, constant: -40),
            
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}

extension WABarView {
    struct BarData {
        let value: String
        let heightParam: Double
        let title: String
    }
}

//
//  StatsItem.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 19.04.2023.
//

import UIKit

enum StatsItem {
    case averagePace (value: String)
    case heartRate (value: String)
    case totalDistance (value: String)
    case totalSteps (value: String)
    
    var data: StatsItemView.ItemData {
        switch self {
        case .averagePace(let value):
            return .init(image: R.Images.Session.Stats.averagePace,
                                                   value: value + " / km",
                         title: R.Strings.Session.Stats.avaragePace)
        case .heartRate(let value):
            return .init(image: R.Images.Session.Stats.heartBeat,
                                                   value: value + " bpm",
                         title: R.Strings.Session.Stats.heartRate)
        case .totalDistance(let value):
            return .init(image: R.Images.Session.Stats.totalDistance,
                                                   value: value + " km",
                         title: R.Strings.Session.Stats.totalDistance)
        case .totalSteps(let value):
            return .init(image: R.Images.Session.Stats.totalSteps,
                                                   value: value,
                         title: R.Strings.Session.Stats.totalSteps)
            
        }
    }
}

final class StatsItemView: WABaseView {
    
    struct ItemData {
        let image: UIImage?
        let value: String
        let title: String
    }
    
    private let imageView = UIImageView()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.titleDarkGrey
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 10)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    func configure(with item: StatsItem) {
        imageView.image = item.data.image
        titleLabel.text = item.data.title.uppercased()
        valueLabel.text = item.data.value
    }
}

extension StatsItemView {
    override func setupViews() {
        super.setupViews()
        
        setupView(imageView)
        setupView(stackView)
        
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}

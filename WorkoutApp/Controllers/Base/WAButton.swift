//
//  WAButton.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

public enum WAButtonType {
    case primary
    case secondary
}

///- [WA] workout app button
final class WAButton: UIButton {
    
    private var type: WAButtonType = .secondary
    private var title: String?
    
    private let label: UILabel = {
       let label = UILabel()
       label.textAlignment = .center
       return label
    }()
    
    private let iconView: UIImageView = {
       let icon = UIImageView()
       icon.image = R.Images.Common.allWorkoutButton?.withRenderingMode(.alwaysTemplate)
       return icon
    }()
    
  
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    func setTitle(_ title: String?) {
        label.text = title
    }
}

private extension WAButton {
    
    func setupViews() {
        addView(label)
        addView(iconView)
    }
    
    func constraintViews() {
        let horizontalOffcet: CGFloat = {
            switch type {
            case .primary:
                return 0
            case .secondary:
                return 10
            }
        }()
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffcet),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant:  -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalOffcet * 2)
        ])
    }
    
    func configureAppearance() {
        switch type {
        case .primary:
            label.textColor = R.Colors.inactive
            label.font = R.Fonts.helveticaRegular(with: 13)
            iconView.tintColor = R.Colors.inactive
        case .secondary:
            backgroundColor = R.Colors.secondaryBackground
            layer.cornerRadius = 14
            label.textColor = R.Colors.active
            label.font = R.Fonts.helveticaRegular(with: 15)
            iconView.tintColor = R.Colors.active
        }
        
        makeSystem(self)
    }
}


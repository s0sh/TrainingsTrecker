//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 27.02.2023.
//

import UIKit

final class OverviewNavbar: BaseView {
    
    private let allWorkoutsButton: WAButton = {
       let button = WAButton(with: .secondary)
        button.setTitle(R.Strings.Overview.allWorkoutsButtonTitle)
        return button
    }()
    
    private let addButton = UIButton()
    private  let titleLabel = UILabel()
    private let weekView = WeekView()
    
    func allWorkoutAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target,
                                    action: action,
                                    for: .touchUpInside)
    }
    
    func additingAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target,
                                action: action,
                                for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addButtomBorder(with: R.Colors.separator, height: 1)
    }
}

extension OverviewNavbar {
    
    override func setupViews() {
        super.setupViews()
        addView(allWorkoutsButton)
        addView(titleLabel)
        addView(addButton)
        addView(weekView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: -45),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
           
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint (equalTo: addButton.bottomAnchor, constant: 15) ,
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant:47)
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .white
    
        addButton.setImage(R.Images.Common.addButton, for: .normal)
    
        titleLabel.text = R.Strings.NavBar.Title.overview
        titleLabel.textColor = R.Colors.titleDarkGrey
        titleLabel.font = R.Fonts.helveticaRegular(with: 22)
       
    }
}

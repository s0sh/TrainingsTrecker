//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 27.02.2023.
//

import UIKit

final class OverviewNavbar: BaseView {
    
    private let allWorkoutsButton = SecondaryButton()
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
        addButtomBorder(with: Resources.Colors.separator, height: 1)
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
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            
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
       
        allWorkoutsButton.setTitle(Resources.Strings.Overview.allWorkoutsButtonTitle)
        
        addButton.setImage(Resources.Images.Common.addButton, for: .normal)
        
        titleLabel.text = Resources.Strings.NavBar.Title.overview
        titleLabel.textColor = Resources.Colors.titleDarkGrey
        titleLabel.font = Resources.Fonts.helveticaRegular(with: 22)
       
    }
}

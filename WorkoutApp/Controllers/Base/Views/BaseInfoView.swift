//
//  BaseInfoView.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 28.02.2023.
//

import UIKit

class BaseInfoView: BaseView {
    private let titleLabel = UILabel()
    private let contentView = UIView()
}

extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
    }
    
    override func constraintViews() {
        super.constraintViews()
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}

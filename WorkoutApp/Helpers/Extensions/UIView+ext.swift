//
//  UIView+ext.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

extension UIView {
    
    func addButtomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0,
                                 y: frame.height - height,
                                 width: frame.width,
                                 height: height)
        addSubview(separator)
    }
    
    // MARK: - System behaviour for custom button
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector (handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        button.addTarget(self, action: #selector (handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.15) { self.alpha = 0.55 }
    }
    
    @objc func handleOut() {
        UIView.animate(withDuration: 0.15) { self.alpha = 1 }
    }
    
    // MARK: - Needs for that so we wont add translatesAutoresizingMaskIntoConstraints for each newly added view
    ///- substitution for regular addSubView UIView method
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
        
}

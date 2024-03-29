//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 06.03.2023.
//

import UIKit

enum TimerState {
    case isRunning
    case isStopped
    case isPaused
}

final class TimerView: WABaseInfoView {
    // MARK: - View properties
    private let elapsedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Session.elapsedTime
        label.font = R.Fonts.helveticaRegular(with: 14)
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let remeaningTimeLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Session.remeaningTime
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elapsedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 46)
        label.textColor = R.Colors.titleDarkGrey
        label.textAlignment = .center
        return label
    }()
    
    private let remeaningTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.titleDarkGrey
        label.textAlignment = .center
        return label
    }()
    
    private let timerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    // MARK: - PercentsView
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()
    
    private let completedPercentView = TimerView.PercentView()
    private let remainingPercentView = TimerView.PercentView()
    private let separatorPercentView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()
    
    // MARK: - ProgressView & Timer view
    private let progressView = ProgressView()
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    public var state: TimerState = .isStopped
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        let roudedPercent = Int(round(percent * 100))
        
        elapsedTimeValueLabel.text = getDisplayedString(from: Int(tempCurrentValue))
        remeaningTimeValueLabel.text = getDisplayedString(from: Int(duration) - Int(tempCurrentValue))
        completedPercentView.configure(eith: "COMPLETED", andValue: roudedPercent)
        remainingPercentView.configure(eith: "REMAINING", andValue: 100 - roudedPercent)
        progressView.draawProgress(with: CGFloat(percent))
        
    }
}
// MARK: - Setup Timer & Progress
extension TimerView {
    override func setupViews() {
        super.setupViews()
        addView(progressView)
        addView(timerStackView)
        addView(bottomStackView)
        
        [elapsedTimeLabel, elapsedTimeValueLabel, remeaningTimeLabel, remeaningTimeValueLabel]
            .forEach(timerStackView.addArrangedSubview)
        
        [completedPercentView, separatorPercentView, remainingPercentView]
            .forEach(bottomStackView.addArrangedSubview)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timerStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            timerStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            separatorPercentView.widthAnchor.constraint(equalToConstant: 1)
            
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
    func startTimer(completion: @escaping () -> Void) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                completion()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
            
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard self.timerProgress > 0 else { return }
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= self.timerProgress * 0.02
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
            
        })
    }
}

// MARK: - Private extension [Time strings helper]
private extension TimerView {
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0 ? [minutesStr, secondsStr].joined(separator: ":") : [hoursStr, minutesStr, secondsStr].joined(separator: ":")
    }
}

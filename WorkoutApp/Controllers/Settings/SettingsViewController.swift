//
//  SettingsViewController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

class SettingsViewController: WABaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .settings)
    }

}

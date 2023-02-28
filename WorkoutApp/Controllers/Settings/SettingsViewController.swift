//
//  SettingsViewController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

class SettingsViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .settings)
    }

}

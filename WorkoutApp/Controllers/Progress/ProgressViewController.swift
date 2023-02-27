//
//  ProgressViewController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

class ProgressViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Resources.Strings.NavBar.Title.progress
        navigationController?.tabBarItem.title = Resources.Strings.Tbbar.overview
        addNavBarButton(at: .left, with: "Export")
        addNavBarButton(at: .right, with: "Details")
    }

}

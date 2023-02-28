//
//  SessionViewController.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

class SessionViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Resources.Strings.NavBar.Title.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .session)
        addNavBarButton(at: .left, with: Resources.Strings.SessionButton.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.SessionButton.navBarRight)
    }
}

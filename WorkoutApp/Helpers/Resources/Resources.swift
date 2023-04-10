//
//  R.swift
//  WorkoutApp
//
//  Created by Roman Bigun on 14.02.2023.
//

import UIKit

typealias R = Resources

enum Resources {
   
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let titleDarkGrey = UIColor(hexString: "#545C77")
        static let backgroundMain = UIColor(hexString: "#F8f9F9")
        static let secondaryBackground = UIColor(hexString: "#F0F3FF")
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
               switch tab {
               case .overview: return "Overview"
               case .session: return "Session"
               case .progress: return "Progress"
               case .settings: return "Settings"
               }
           }
        }
        
        enum NavBar {
            enum Title {
                static let overview = "Today"
                static let session = "Hight Intensity Cardio"
                static let progress = "Workout Progress"
                static let settings = "Settings"
            }
        }
        
        enum SessionButton {
            static let navBarPaused = "Pause"
            static let navBarFinish = "Finish"
            static let navBarStart = "Start   "
        }
        
        enum ProgressButton {
            static let navBarLeft = "Export"
            static let navBarRight = "Details"
        }
        
        enum Overview {
            static let allWorkoutsButtonTitle = "All Workouts"
        }
    }
    
    enum Images {
        enum TabBar {
             static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: return UIImage(named: "overview_tab")
                case .session: return UIImage (named: "session_tab")
                case .progress: return UIImage (named: "progress_tab")
                case .settings: return UIImage(named: "settings_tab")
                }
            }
        }
        
        enum Common {
            static let allWorkoutButton = UIImage(named: "down_arrow")
            static let addButton = UIImage(named: "addButton")
            
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            return UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}

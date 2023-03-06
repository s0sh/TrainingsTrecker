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
        static var active = UIColor(hexString: "#437BFE")
        static var inactive = UIColor(hexString: "#929DA5")
        static var separator = UIColor(hexString: "#E8ECEF")
        static var titleDarkGrey = UIColor(hexString: "#545C77")
        static var backgroundMain = UIColor(hexString: "#F8f9F9")
        static var secondaryBackground = UIColor(hexString: "#F0F3FF")
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
                static var overview = "Today"
                static var session = "Hight Intensity Cardio"
                static var progress = "Workout Progress"
                static var settings = "Settings"
            }
        }
        
        enum SessionButton {
            static var navBarLeft = "Pause"
            static var navBarRight = "Finish"
        }
        
        enum ProgressButton {
            static var navBarLeft = "Export"
            static var navBarRight = "Details"
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

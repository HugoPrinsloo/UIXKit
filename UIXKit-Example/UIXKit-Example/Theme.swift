//
//  Theme.swift
//  UIXKit-Example
//
//  Created by Hugo Prinsloo on 2019/03/25.
//  Copyright © 2019 Hugo. All rights reserved.
//

import UIKit

public enum Appearance: String {
    case light = "light"
    case dark = "dark"
}

struct AppColors {
    // ViewController background color
    let primaryColor: UIColor
    // Bar, cell placeholder color
    let secondaryColor: UIColor
    // Title label color
    let textColor: UIColor
    // Subtitle label color
    let secondaryTextColor: UIColor
    // tintColor
    let tintColor: UIColor
}

protocol AppTheme {
    var appearance: Appearance { get set }
    var lightAppColors: AppColors { get }
    var darkAppColors: AppColors { get }
}

public class AppearanceManager: AppTheme {
    
    static let appearanceDidChangeToLight = NSNotification.Name(rawValue: "appearanceDidChangeLight")
    static let appearanceDidChangeToDark = NSNotification.Name("appearanceDidChangeDark")
    
    static let shared = AppearanceManager()
    
    private enum Keys {
        static let appAppearance = "appAppearance"
    }
    
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(appearanceDidChangeToLightNotification), name: AppearanceManager.appearanceDidChangeToLight, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appearanceDidChangeToDarkNotification), name: AppearanceManager.appearanceDidChangeToDark, object: nil)
    }
 
    // Default light
    var appearance: Appearance {
        get {
            let appearanceString = UserDefaults.standard.value(forKey: Keys.appAppearance) as? String
            let appearance: Appearance = appearanceString == "dark" ? .dark : .light
            return appearance
        }
        set {
            UserDefaults.standard.setValue(newValue.rawValue, forKey: Keys.appAppearance)
        }
    }
    
    var lightAppColors: AppColors {
        return AppColors(primaryColor: #colorLiteral(red: 0.9685427547, green: 0.9686816335, blue: 0.9685124755, alpha: 1), secondaryColor: #colorLiteral(red: 0.905802846, green: 0.9059332013, blue: 0.9057744145, alpha: 1), textColor: #colorLiteral(red: 0.1137115136, green: 0.1137344018, blue: 0.1137065217, alpha: 1), secondaryTextColor: #colorLiteral(red: 0.50583601, green: 0.5059120655, blue: 0.5058193803, alpha: 1), tintColor: #colorLiteral(red: 0.1058690324, green: 0.1058908626, blue: 0.105864279, alpha: 1))
    }
    
    var darkAppColors: AppColors {
        return AppColors(primaryColor: #colorLiteral(red: 0.074499093, green: 0.07451666147, blue: 0.0744952634, alpha: 1), secondaryColor: #colorLiteral(red: 0.003920789808, green: 0.003922066186, blue: 0.003920510877, alpha: 1), textColor: #colorLiteral(red: 0.9607002139, green: 0.9608380198, blue: 0.9606701732, alpha: 1), secondaryTextColor: #colorLiteral(red: 0.4979934692, green: 0.4980684519, blue: 0.497977078, alpha: 1), tintColor: #colorLiteral(red: 0.9779606462, green: 0.8035954833, blue: 0.01084135566, alpha: 1))
    }
    
    @objc func appearanceDidChangeToLightNotification() {
        AppearanceManager.shared.appearance = .light
        updateAppearance()
    }
    
    @objc func appearanceDidChangeToDarkNotification() {
        AppearanceManager.shared.appearance = .dark
        updateAppearance()
    }

    
    func updateAppearance() {
        switch appearance {
        case .dark:
            UINavigationBar.appearance().tintColor = darkAppColors.tintColor
            UINavigationBar.appearance().backgroundColor = darkAppColors.secondaryColor
        case .light:
            UINavigationBar.appearance().tintColor = lightAppColors.tintColor
            UINavigationBar.appearance().backgroundColor = lightAppColors.secondaryColor
        }
        for window in UIApplication.shared.windows {
            for view in window.subviews {
                view.removeFromSuperview()
                window.addSubview(view)
            }
            // update the status bar if you change the appearance of it.
            window.rootViewController?.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    func changeAppearance(to appearance: Appearance) {
        switch appearance {
        case .dark:
            NotificationCenter.default.post(name: AppearanceManager.appearanceDidChangeToDark, object: appearance)
        case .light:
            NotificationCenter.default.post(name: AppearanceManager.appearanceDidChangeToLight, object: appearance)
        }
    }
}



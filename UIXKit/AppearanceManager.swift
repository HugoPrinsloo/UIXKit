//
//  AppearanceManager.swift
//  UIXKit
//
//  Created by Hugo Prinsloo on 2019/03/28.
//  Copyright © 2019 Hugo. All rights reserved.
//

import UIKit

public enum AppearanceType: String {
    case light = "light"
    case dark = "dark"
}

public struct AppColors {
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

protocol Appearance {
    var appearance: AppearanceType { get set }
    var lightAppColors: AppColors { get }
    var darkAppColors: AppColors { get }
}

public class AppearanceManager: Appearance {
    static private let appearanceDidChangeToLight = NSNotification.Name(rawValue: "appearanceDidChangeLight")
    static private let appearanceDidChangeToDark = NSNotification.Name("appearanceDidChangeDark")
    
    private enum Keys {
        static let appAppearance = "appAppearance"
    }
    
    public var lightAppColors: AppColors
    public var darkAppColors: AppColors
    
    init(lightAppColors: AppColors, darkAppColors: AppColors) {
        self.lightAppColors = lightAppColors
        self.darkAppColors = darkAppColors
        NotificationCenter.default.addObserver(self, selector: #selector(appearanceDidChangeToLightNotification), name: AppearanceManager.appearanceDidChangeToLight, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appearanceDidChangeToDarkNotification), name: AppearanceManager.appearanceDidChangeToDark, object: nil)
    }
    
    internal var appearance: AppearanceType {
        get {
            let appearanceString = UserDefaults.standard.value(forKey: Keys.appAppearance) as? String
            let appearance: AppearanceType = appearanceString == "dark" ? .dark : .light
            return appearance
        }
        set {
            UserDefaults.standard.setValue(newValue.rawValue, forKey: Keys.appAppearance)
        }
    }
    
    fileprivate var controllerBackgroundColor: UIColor {
        return appearance == .light ? lightAppColors.primaryColor : darkAppColors.primaryColor
    }
    
    @objc private func appearanceDidChangeToLightNotification() {
        appearance = .light
        updateAppearance()
    }
    
    @objc private func appearanceDidChangeToDarkNotification() {
        appearance = .dark
        updateAppearance()
    }
    
    // Called in AppDelegate
    func updateAppearance() {
        switch appearance {
        case .dark:
            UINavigationBar.appearance().tintColor = darkAppColors.tintColor
            UINavigationBar.appearance().barTintColor = darkAppColors.secondaryColor
            UIButton.appearance().tintColor = darkAppColors.textColor
            UILabel.appearance().tintColor = darkAppColors.textColor
            UIView.appearance().backgroundColor = darkAppColors.secondaryColor
        case .light:
            UINavigationBar.appearance().tintColor = lightAppColors.tintColor
            UINavigationBar.appearance().barTintColor = lightAppColors.secondaryColor
            UIButton.appearance().tintColor = lightAppColors.textColor
            UILabel.appearance().tintColor = lightAppColors.textColor
            UIView.appearance().backgroundColor = lightAppColors.secondaryColor
        }
        refreshUI()
    }
    
    // Called when changing appearance
    func changeAppearance(to appearance: AppearanceType) {
        switch appearance {
        case .dark:
            NotificationCenter.default.post(name: AppearanceManager.appearanceDidChangeToDark, object: appearance)
        case .light:
            NotificationCenter.default.post(name: AppearanceManager.appearanceDidChangeToLight, object: appearance)
        }
    }
    
    private func refreshUI() {
        for window in UIApplication.shared.windows {
            for view in window.subviews {
                view.removeFromSuperview()
                window.addSubview(view)
            }
            // update the status bar if you change the appearance of it.
            window.rootViewController?.setNeedsStatusBarAppearanceUpdate()
        }
    }
}

public class UIViewControllerThemed: UIViewController {
    
    var appearanceManager: AppearanceManager
    
    init(_ appearanceManager: AppearanceManager) {
        self.appearanceManager = appearanceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = appearanceManager.controllerBackgroundColor
    }
}

//
//  AppDelegate.swift
//  UIXKit-Example
//
//  Created by Hugo Prinsloo on 2019/03/24.
//  Copyright © 2019 Hugo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

//extension UIViewController {
//    var appearanceManager: AppearanceManager {
//        var lightAppColors: AppColors {
//            return AppColors(primaryColor: #colorLiteral(red: 0.9685427547, green: 0.9686816335, blue: 0.9685124755, alpha: 1), secondaryColor: #colorLiteral(red: 0.905802846, green: 0.9059332013, blue: 0.9057744145, alpha: 1), textColor: #colorLiteral(red: 0.1137115136, green: 0.1137344018, blue: 0.1137065217, alpha: 1), secondaryTextColor: #colorLiteral(red: 0.50583601, green: 0.5059120655, blue: 0.5058193803, alpha: 1), tintColor: #colorLiteral(red: 0.1058690324, green: 0.1058908626, blue: 0.105864279, alpha: 1))
//        }
//        
//        var darkAppColors: AppColors {
//            return AppColors(primaryColor: #colorLiteral(red: 0.074499093, green: 0.07451666147, blue: 0.0744952634, alpha: 1), secondaryColor: #colorLiteral(red: 0.003920789808, green: 0.003922066186, blue: 0.003920510877, alpha: 1), textColor: #colorLiteral(red: 0.9607002139, green: 0.9608380198, blue: 0.9606701732, alpha: 1), secondaryTextColor: #colorLiteral(red: 0.4979934692, green: 0.4980684519, blue: 0.497977078, alpha: 1), tintColor: #colorLiteral(red: 0.9779606462, green: 0.8035954833, blue: 0.01084135566, alpha: 1))
//        }
//        
//        return appearanceManager = AppearanceManager(lightAppColors: lightAppColors, darkAppColors: darkAppColors)
//    }
//}
//


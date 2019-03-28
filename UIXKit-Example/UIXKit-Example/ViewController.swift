//
//  ViewController.swift
//  UIXKit-Example
//
//  Created by Hugo Prinsloo on 2019/03/24.
//  Copyright © 2019 Hugo. All rights reserved.
//

import UIKit
import UIXKit

class ViewController: UIViewController {
    
    
    var lightAppColors: AppColors {
        return AppColors(primaryColor: #colorLiteral(red: 0.9685427547, green: 0.9686816335, blue: 0.9685124755, alpha: 1), secondaryColor: #colorLiteral(red: 0.905802846, green: 0.9059332013, blue: 0.9057744145, alpha: 1), textColor: #colorLiteral(red: 0.1137115136, green: 0.1137344018, blue: 0.1137065217, alpha: 1), secondaryTextColor: #colorLiteral(red: 0.50583601, green: 0.5059120655, blue: 0.5058193803, alpha: 1), tintColor: #colorLiteral(red: 0.1058690324, green: 0.1058908626, blue: 0.105864279, alpha: 1))
    }
    
    var darkAppColors: AppColors {
        return AppColors(primaryColor: #colorLiteral(red: 0.074499093, green: 0.07451666147, blue: 0.0744952634, alpha: 1), secondaryColor: #colorLiteral(red: 0.003920789808, green: 0.003922066186, blue: 0.003920510877, alpha: 1), textColor: #colorLiteral(red: 0.9607002139, green: 0.9608380198, blue: 0.9606701732, alpha: 1), secondaryTextColor: #colorLiteral(red: 0.4979934692, green: 0.4980684519, blue: 0.497977078, alpha: 1), tintColor: #colorLiteral(red: 0.9779606462, green: 0.8035954833, blue: 0.01084135566, alpha: 1))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeTheme(_ sender: Any) {
        let theme = AppearanceManager.shared.appearance
        if theme == .light {
            AppearanceManager.shared.changeAppearance(to: .dark)
        } else {
            AppearanceManager.shared.changeAppearance(to: .light)
        }
    }
}


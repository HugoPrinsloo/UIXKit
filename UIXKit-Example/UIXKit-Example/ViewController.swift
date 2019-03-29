//
//  ViewController.swift
//  UIXKit-Example
//
//  Created by Hugo Prinsloo on 2019/03/24.
//  Copyright © 2019 Hugo. All rights reserved.
//

import UIKit
import UIXKit

class ViewController: UIViewControllerThemed {
    
    @IBOutlet weak var someView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        someView.backgroundColor = #colorLiteral(red: 0.01567558385, green: 0.8495691419, blue: 0.7508087754, alpha: 1)
    }

    @IBAction func changeTheme(_ sender: Any) {
        let theme = appearanceManager.appearance
        if theme == .light {
            appearanceManager.changeAppearance(to: .dark)
        } else {
            appearanceManager.changeAppearance(to: .light)
        }
    }
}


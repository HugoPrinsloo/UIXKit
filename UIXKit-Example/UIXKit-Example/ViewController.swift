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
    
    let redView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.fillSuperview()
        redView.backgroundColor = .red
        
    }


}


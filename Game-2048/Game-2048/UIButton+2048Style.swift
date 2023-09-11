//
//  UIButton+2048Style.swift
//  Game-2048
//
//  Created by Tomasz Szulc on 25/07/15.
//  Copyright (c) 2015 Tomasz Szulc. All rights reserved.
//

import UIKit

extension UIButton {
    
    func styleLight() {
        layer.cornerRadius = 8.0
        backgroundColor = AppColor.Button.color
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        setTitleColor(UIColor.white, for: UIControl.State.normal)
    }
}

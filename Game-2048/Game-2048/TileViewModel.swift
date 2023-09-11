//
//  TileViewModel.swift
//  Game-2048
//
//  Created by Tomasz Szulc on 25/07/15.
//  Copyright (c) 2015 Tomasz Szulc. All rights reserved.
//

import UIKit

class TileViewModel {
    
    let value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    var valueText: String {
        if value == 2 {
            return "小白"
        }
        if value == 4 {
            return "占卜家"
        }
        if value == 8 {
            return "小丑"
        }
        if value == 16 {
            return "魔术师"
        }
        if value == 32 {
            return "无面人"
        }
        if value == 64 {
            return "秘偶大师"
        }
        if value == 128 {
            return "诡法师"
        }
        if value == 256 {
            return "古代学者"
        }
        if value == 512 {
            return "奇迹师"
        }
        if value == 1024 {
            return "诡秘侍者"
        }
        if value == 2048 {
            return "愚者"
        }
        
        return "\(value)"
    }
    
    var textFont : UIFont {
        if valueText.count > 3 {
            return UIFont.systemFont(ofSize: 16)
        } else {
            return UIFont.systemFont(ofSize: 20)
        }
    }
    
    var backgroundColor: UIColor {
        switch value {
        case 2: return UIColor(red:0.5, green:0.77, blue:0.73, alpha:1)
        case 4: return UIColor(red:0.73, green:0.29, blue:0.42, alpha:1)
        case 8: return UIColor(red:0.58, green:0.73, blue:0.13, alpha:1)
        case 16: return UIColor(red:0.94, green:0.77, blue:0.34, alpha:1)
        case 32: return UIColor(red:0.84, green:0.49, blue:0.32, alpha:1)
        case 64: return UIColor(red:0.36, green:0.52, blue:0.84, alpha:1)
        case 128: return UIColor(red:0.46, green:0.74, blue:0.51, alpha:1)
        case 256: return UIColor(red:0.85, green:0.45, blue:0.13, alpha:1)
        case 512: return UIColor(red:0.5, green:0.27, blue:0.53, alpha:1)
        case 1024: return UIColor(red:0.83, green:0.27, blue:0.36, alpha:1)
        case 2048: return UIColor(red:0.88, green:0.6, blue:0.14, alpha:1)
        default: return UIColor.clear // This will never happen.
        }
    }
}

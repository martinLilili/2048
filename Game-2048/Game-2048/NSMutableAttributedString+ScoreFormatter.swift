//
//  NSMutableAttributedString+ScoreFormatter.swift
//  Game-2048
//
//  Created by Tomasz Szulc on 25/07/15.
//  Copyright (c) 2015 Tomasz Szulc. All rights reserved.
//

import Foundation
import UIKit
extension NSMutableAttributedString {
    
    class func scoreDescription(text: String, points: Int) -> NSAttributedString {
        let pointsString = "\(points)"
        let text = "\(text): \(points)"
        let attributed = NSMutableAttributedString(string: text)
        attributed.setAttributes([NSAttributedString.Key.foregroundColor: AppColor.Yellow.color], range: NSMakeRange(text.count - pointsString.count, pointsString.count))
        return attributed
    }
}

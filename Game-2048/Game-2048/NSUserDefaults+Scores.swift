//
//  NSUserDefaults+Scores.swift
//  Game-2048
//
//  Created by Tomasz Szulc on 25/07/15.
//  Copyright (c) 2015 Tomasz Szulc. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    enum Key: String {
        case HighScore = "HighScore"
    }
    
    func registerDefaults() {
        UserDefaults.standard.register(defaults: [Key.HighScore.rawValue: NSNumber(value: 0)])
    }
    
    func highScore() -> Int {
        return UserDefaults.standard.integer(forKey: Key.HighScore.rawValue)
    }
    
    func saveHighScore(score: Int) {
        let defaults = UserDefaults.standard
        defaults.set(score, forKey: Key.HighScore.rawValue)
        defaults.synchronize()
    }
}

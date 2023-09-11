//
//  GameBoardView.swift
//  Game-2048
//
//  Created by Tomasz Szulc on 25/07/15.
//  Copyright (c) 2015 Tomasz Szulc. All rights reserved.
//

import UIKit

protocol GameBoardViewDelegate {
    func gameBoardView(view: GameBoardView, didSwipeInDirection direction: ShiftDirection)
}

class GameBoardView: UIView {
    
    var delegate: GameBoardViewDelegate?
//    private var startLocation: CGPoint = CGPointZero
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first!
//        startLocation = touch.location(in: self)
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first!
//        let newLocation = touch.location(in: self)
//        let prevLocation = startLocation
//
//        var directionX: ShiftDirection!
//        if newLocation.x > prevLocation.x {
//            directionX = .Right
//        } else {
//            directionX = .Left
//        }
//
//        var directionY: ShiftDirection!
//        if newLocation.y > prevLocation.y {
//            directionY = .Down
//        } else {
//            directionY = .Up
//        }
//
//        var direction: ShiftDirection!
//        if abs(newLocation.x - prevLocation.x) > abs(newLocation.y - prevLocation.y) {
//            direction = directionX
//        } else {
//            direction = directionY
//        }
//
//        delegate?.gameBoardView(view: self, didSwipeInDirection: direction)
//    }
}

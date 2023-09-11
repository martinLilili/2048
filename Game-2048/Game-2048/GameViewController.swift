//
//  GameViewController.swift
//  Game-2048
//
//  Created by Tomasz Szulc on 25/07/15.
//  Copyright (c) 2015 Tomasz Szulc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, GameBoardViewDelegate, GameLogicManagerDelegate, GameOverViewControllerDelegate {


    enum SegueIdentifier: String {
        case GameOver = "GameOver"
    }
    
    @IBOutlet private var currentScoreLabel: UILabel!
    @IBOutlet private var bestScoreLabel: UILabel!
    @IBOutlet private var restartButton: UIButton!
    @IBOutlet private var finishButton: UIButton!
    @IBOutlet private var boardView: GameBoardView!
    
    private let gameManager = GameLogicManager()
    private let viewModel = GameViewModel()
    private var renderer: GameBoardRenderer!

    private var currentScore: Int = 0
    private var win: Bool = false
    var highScore: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardView.delegate = self
        renderer = GameBoardRenderer(boardView: boardView)
        
        gameManager.delegate = self
        gameManager.startGame()
        
        restartButton.styleLight()
        finishButton.styleLight()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateScores()
    }
    
    private func gameOver() {
        saveHighScore()
        self.performSegue(withIdentifier: SegueIdentifier.GameOver.rawValue, sender: nil)
    }
    
    private func userWin() {
        win = true
        saveHighScore()
        self.performSegue(withIdentifier: SegueIdentifier.GameOver.rawValue, sender: nil)
    }
    
    private func saveHighScore() {
        if UserDefaults.standard.highScore() < currentScore {
            UserDefaults.standard.saveHighScore(score: currentScore)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.GameOver.rawValue {
            let gameOverViewController = segue.destination as! GameOverViewController
            gameOverViewController.score = currentScore
            gameOverViewController.delegate = self
            gameOverViewController.win = win
        }
    }
    
    private func updateScores() {
        currentScoreLabel.attributedText = viewModel.scoreText(points: currentScore)
        bestScoreLabel.attributedText = viewModel.bestScoreText(points: highScore)
    }
    
    private func restart() {
        renderer.reset()
        currentScore = 0
        highScore = UserDefaults.standard.highScore()
        updateScores()
        gameManager.startGame()
    }
    
    @IBAction func restartPressed(sender: AnyObject) {
        let alertController = UIAlertController(title: "Restart Game", message: "Are you sure?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in self.restart() }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func finishPressed(sender: AnyObject) {
        let alertController = UIAlertController(title: "Finish Game", message: "Are you sure?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in self.gameOver() }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: GameBoardViewDelegate
    func gameBoardView(view: GameBoardView, didSwipeInDirection direction: ShiftDirection) {
        gameManager.shift(direction: direction)
    }
    
    // MARK: GameLogicManagerDelegate
    func gameLogicManagerDidAddTile(tile: Tile?) {
        if let tile = tile { renderer.addTile(tile: tile) }
    }
    
    func gameLogicManagerDidMoveTile(sourceTile: Tile, onTile destinationTile: Tile, completionBlock: @escaping() -> Void) {
        renderer.moveTile(sourceTile: sourceTile, onTile: destinationTile, completionBlock: completionBlock)
    }
    
    func gameLogicManagerDidMoveTile(tile: Tile, position: Position, completionBlock: @escaping() -> Void) {
        renderer.moveTile(tile: tile, position: position, completionBlock: completionBlock)
    }
    
    func gameLogicManagerDidCountPoints(points: Int) {
        currentScore = points
        if highScore < points { highScore = points }
        updateScores()
    }
    
    func gameLogicManagerDidGameOver() {
        gameOver()
    }
    
    func gameLogicManagerDidWinGame() {
        userWin()
    }
    
    // MARK: GameOverViewControllerDelegate
    func gameOverControllerDidTapRestart() {
        restart()
    }
    
    
    private var startLocation: CGPoint = CGPointZero
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        startLocation = touch.location(in: self.view)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let newLocation = touch.location(in: self.view)
        let prevLocation = startLocation
        
        var directionX: ShiftDirection!
        if newLocation.x > prevLocation.x {
            directionX = .Right
        } else {
            directionX = .Left
        }
        
        var directionY: ShiftDirection!
        if newLocation.y > prevLocation.y {
            directionY = .Down
        } else {
            directionY = .Up
        }
        
        var direction: ShiftDirection!
        if abs(newLocation.x - prevLocation.x) > abs(newLocation.y - prevLocation.y) {
            direction = directionX
        } else {
            direction = directionY
        }
        
        gameManager.shift(direction: direction)
        
    }
}

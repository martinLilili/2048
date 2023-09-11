//
//  MainMenuViewController.swift
//  Game-2048
//
//  Created by Tomasz Szulc on 25/07/15.
//  Copyright (c) 2015 Tomasz Szulc. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    enum SegueIdentifier: String {
        case NewGame = "NewGame"
    }
    
    @IBOutlet private var highScoreLabel: UILabel!
    @IBOutlet private var newGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGameButton.styleLight()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let highScore = UserDefaults.standard.highScore()
        let viewModel = MainMenuViewModel(points: highScore)
        highScoreLabel.attributedText = viewModel.highScoreText
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier {
            switch SegueIdentifier(rawValue: segueIdentifier)! {
            case .NewGame:
                let gameViewController = segue.destination as! GameViewController
                gameViewController.highScore = UserDefaults.standard.highScore()
            }
        }
    }
}


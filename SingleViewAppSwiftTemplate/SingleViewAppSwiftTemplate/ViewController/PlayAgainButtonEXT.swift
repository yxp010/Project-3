//
//  PlayAgainButton.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/19/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    // Play Again Button Layout
    func setupPlayAgainButtonLayout() {
        scoreContainer.addSubview(playAgainButton)
        playAgainButton.topAnchor.constraint(equalTo: scoreContainer.centerYAnchor, constant: 40).isActive = true
        playAgainButton.centerXAnchor.constraint(equalTo: scoreContainer.centerXAnchor).isActive = true
        playAgainButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        playAgainButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    // startNew Game function used by play again button to load a new game.
    func startNewGame() {
        display(allOptionContainerIsHidden: false, shakeToCompleteLabelIsHidden: false, scoreDisplayIsHidden: true)
        resetGameData()
        quizManager.createEvents()
        nextRound()
    }
    
    // Function used inside 'startNewGame' Function to reset all game data.
    func resetGameData() {
        quizManager.correctAnswer = 0
        quizManager.roundsPlayed = 0
        quizManager.eventsIndexes = [Int]()
        quizManager.selectedHistoryEventsForEntireGame = [HistoryEvent]()
    }
}

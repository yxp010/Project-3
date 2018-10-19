//
//  ScoreDisplay.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/18/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    // MARK: - Score Display Set up
    func setupScoreDisplay() {
        setupScoreContainer()
        setupScoreNumberLayout()
        setupScoreTextLayout()
        setupPlayAgainButtonLayout()
    }
    
    // MARK: - Score Container Layout
    func setupScoreContainer() {
        view.addSubview(scoreContainer)
        scoreContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        scoreContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        scoreContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        scoreContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        
    }
    
    // MARK: - Score Number Layout
    func setupScoreNumberLayout() {
        scoreContainer.addSubview(scoreNumber)
        scoreNumber.bottomAnchor.constraint(equalTo: scoreContainer.centerYAnchor, constant: -40).isActive = true
        scoreNumber.leadingAnchor.constraint(equalTo: scoreContainer.leadingAnchor).isActive = true
        scoreNumber.trailingAnchor.constraint(equalTo: scoreContainer.trailingAnchor).isActive = true
        scoreNumber.heightAnchor.constraint(equalToConstant: 70).isActive = true
        scoreNumber.font = UIFont.systemFont(ofSize: 60)
    }
    
    // MARK: - ScoreText Layout
    func setupScoreTextLayout() {
        scoreContainer.addSubview(scoreText)
        scoreText.bottomAnchor.constraint(equalTo: scoreNumber.topAnchor).isActive = true
        scoreText.leadingAnchor.constraint(equalTo: scoreContainer.leadingAnchor).isActive = true
        scoreText.trailingAnchor.constraint(equalTo: scoreContainer.trailingAnchor).isActive = true
        scoreText.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
}

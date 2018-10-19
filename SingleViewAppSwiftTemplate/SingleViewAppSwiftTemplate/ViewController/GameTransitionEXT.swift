//
//  GameTransitionFunctions.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/18/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    // MARK: - Next Round Button Layout
    func setupNextRoundButton() {
        view.addSubview(nextRoundButton)
        nextRoundButton.isHidden = true
        nextRoundButton.topAnchor.constraint(equalTo: allOptionContainer.bottomAnchor, constant: 20).isActive = true
        nextRoundButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextRoundButton.widthAnchor.constraint(equalToConstant: 170).isActive = true
        nextRoundButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    // MARK: - Next Round Button Function
    func nextRound() {
        shakeToCompleteIndicator.text = "Shake to complete"
        if quizManager.roundsPlayed == quizManager.totalRounds {
            display(allOptionContainerIsHidden: true, nextRoundButtonIsHidden: true, shakeToCompleteLabelIsHidden: true, scoreDisplayIsHidden: false)
        } else {
            roundIsEnd = false
            display(timerFieldIsHidden: false, nextRoundButtonIsHidden: true, buttonsEnabled: true)
            quizManager.createNextRoundEvents()
            quizManager.correctOrderOfEvents()
            loadEventsOnReferenceButtons()
        }
        
    }
    
}

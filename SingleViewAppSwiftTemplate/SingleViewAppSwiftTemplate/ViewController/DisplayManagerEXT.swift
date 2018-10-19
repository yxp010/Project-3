//
//  DisplayFunction.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/19/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    // MARK: - Display Manager
    // Display Manager controls which to show and how we show displays on screen.
    func display(allOptionContainerIsHidden: Bool? = nil, timerFieldIsHidden: Bool? = nil, nextRoundButtonIsHidden: Bool? = nil, shakeToCompleteLabelIsHidden: Bool? = nil, scoreDisplayIsHidden: Bool? = nil, buttonsEnabled: Bool? = nil, referenceButtonEnabled: Bool? = nil) {
        
        if let buttonsEnabledOrNot = buttonsEnabled {
            for buttons in switchButtonContainerArray {
                for button in buttons {
                    button.isEnabled = buttonsEnabledOrNot
                }
            }
        }
        if let hideOrNot = allOptionContainerIsHidden {
            allOptionContainer.isHidden = hideOrNot
        }
        if let hideOrNot = timerFieldIsHidden {
            if hideOrNot == false {
                secondsOnTimer = initialTimer
                timerField.text = "0:\(initialTimer)"
                loadTimer()
            }
            timerField.isHidden = hideOrNot
            
        }
        if let hideOrNot = nextRoundButtonIsHidden {
            nextRoundButton.isHidden = hideOrNot
        }
        if let hideOrNot = shakeToCompleteLabelIsHidden {
            shakeToCompleteIndicator.isHidden = hideOrNot
        }
        if let hideOrNot = scoreDisplayIsHidden {
            scoreNumber.text = "\(quizManager.correctAnswer)/\(quizManager.totalRounds)"
            scoreContainer.isHidden = hideOrNot
        }
        if let buttonsEnabledOrNot = referenceButtonEnabled {
            for button in referenceButtonArray {
                button.isEnabled = buttonsEnabledOrNot
            }
        }
        
    }
    
    // Loads Contents On Reference Buttons Function
    func loadEventsOnReferenceButtons() {
        for (index,button) in referenceButtonArray.enumerated() {
            button.setTitle(quizManager.currentRoundEvents[index].descreption, for: .normal)
            button.isEnabled = false
        }
    }
}

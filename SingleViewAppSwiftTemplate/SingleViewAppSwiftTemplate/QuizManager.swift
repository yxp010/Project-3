//
//  ButtonsAndTextFields.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/11/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit
import GameKit

class QuizManager {
    
    let allEvents: [HistoryEvent]
    
    init(allEvents: [HistoryEvent]) {
        self.allEvents = allEvents
    }
    
    var selectedHistoryEventsForEntireGame = [HistoryEvent]()
    var eventsIndexes = [Int]()
    let numberEventsPerRound = 4
    var currentRoundEvents = [HistoryEvent]()
    var eventsInCorrectOrder = [HistoryEvent]()
    var correctAnswer = 0
    var roundsPlayed = 0
    let totalRounds = 6
    
    func createEvents() {
        selectedHistoryEventsForEntireGame = [HistoryEvent]()
        let indexGenerator = GKShuffledDistribution(lowestValue: 0, highestValue: allEvents.count - 1)
        for _ in 0...allEvents.count - 1 {
            eventsIndexes.append(indexGenerator.nextInt())
        }
        
        for index in eventsIndexes {
            selectedHistoryEventsForEntireGame.append(allEvents[index])
        }
    }
    
    func createNextRoundEvents() {
        var events = [HistoryEvent]()
        for _ in 0...numberEventsPerRound - 1 {
            events.append(selectedHistoryEventsForEntireGame.remove(at: 0))
        }
        currentRoundEvents = events
    }

    
    func correctOrderOfEvents() {
        var swapped = false
        eventsInCorrectOrder = currentRoundEvents
        repeat {
            swapped = false
            for _ in 0...eventsInCorrectOrder.count - 1 {
                for index in 0...eventsInCorrectOrder.count - 2 {
                    let event = eventsInCorrectOrder[index]
                    let nextEvent = eventsInCorrectOrder[index + 1]
                    if event.year > nextEvent.year {
                        eventsInCorrectOrder.swapAt(index, index + 1)
                        swapped = true
                    } else if event.year == nextEvent.year {
                        if event.month > nextEvent.month {
                            eventsInCorrectOrder.swapAt(index, index + 1)
                            swapped = true
                        } else if event.month == nextEvent.month {
                            if event.day > nextEvent.day {
                                eventsInCorrectOrder.swapAt(index, index + 1)
                                swapped = true
                            }
                        }
                    }
                }
            }
        } while swapped
    }
    
    func checkAnswer() -> Bool {
        var answer = true
        for (index, event) in currentRoundEvents.enumerated() {
            if event != eventsInCorrectOrder[index] {
                answer = false
                break
            }
        }
        return answer
    }

}
































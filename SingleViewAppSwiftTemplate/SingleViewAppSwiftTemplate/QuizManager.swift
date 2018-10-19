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
    let numberOfEventsPerRound = 4
    var currentRoundEvents = [HistoryEvent]()
    var eventsInCorrectOrder = [HistoryEvent]()
    var correctAnswer = 0
    var roundsPlayed = 0
    let totalRounds = 6
    
    // This function creates 24 events which is total number of events needed in entire game.
    // Function shuffled all indexes in 'allEvents'(all events we created), and randomly pick 24 of them. Next, it appends all events with picked indexes to 'selectedHistoryEventsForEntireGame'
    // Thus, 'selectedHistoryEventsForEntireGame' will contain all events we need in entire game.
    func createEvents() {
        let totalEventsNeededPerGame = numberOfEventsPerRound * totalRounds
        selectedHistoryEventsForEntireGame = [HistoryEvent]()
        let indexGenerator = GKShuffledDistribution(lowestValue: 0, highestValue: allEvents.count - 1)
        for _ in 0..<totalEventsNeededPerGame {
            eventsIndexes.append(indexGenerator.nextInt())
        }
        
        for index in eventsIndexes {
            selectedHistoryEventsForEntireGame.append(allEvents[index])
            print(index)
        }
    }
    
    // This function will pick first four events from 'selectedHistoryEventsForEntireGame' and remove them from original Array simultaneously.
    // The picked four events will be used in the upcoming round and assigned into currentRoundEvents.
    // This function is called right before next round is loaded, so it does not affect 'currentRoundEvents' while playing the game.
    func createNextRoundEvents() {
        var events = [HistoryEvent]()
        for _ in 0..<numberOfEventsPerRound {
            events.append(selectedHistoryEventsForEntireGame.remove(at: 0))
        }
        currentRoundEvents = events
    }

    // This function uses bubble sort to sort currentRound chronologically based on comparing their year, month, and day.
    // And, they will assigned into 'eventsInCorrectOrder'. The 'currentRoundEvents' will not change.
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
    
    // This function is comparing if the order of events in 'currentRoundEvents' is same as eventsInCorrectOrder.
    // If there is that one of order of events in 'currentRoundEvents' is different from 'eventsInCorrectOrder', variable 'answer' will be assigned as false and returned. Otherwise, 'answer' will return as true.
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
































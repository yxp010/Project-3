//
//  Buttons.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/11/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

struct HistoryEvent: Equatable {
    let descreption: String
    let year: Int
    let month: Int
    let day: Int
    let website: String
    
    init(descreption: String, year: Int, month: Int, day: Int, website: String) {
        self.descreption = descreption
        self.year = year
        self.month = month
        self.day = day
        self.website = website
        
    }
    // Follow 'Equatable' Protocol to allow 'HistoryEvent' to be compared.
    static func ==(lhs: HistoryEvent, rhs: HistoryEvent) -> Bool {
        return lhs.descreption == rhs.descreption
    }
    
}


let events = [
    HistoryEvent(descreption: "Start of World War II", year: 1939, month: 9, day: 1, website: "https://en.wikipedia.org/wiki/World_War_II"),
    HistoryEvent(descreption: "Start of Vietnam War", year: 1955, month: 11, day: 1, website: "https://en.wikipedia.org/wiki/Vietnam_War"),
    HistoryEvent(descreption: "Start of Korean War", year: 1950, month: 6, day: 25, website: "https://en.wikipedia.org/wiki/Korean_War"),
    HistoryEvent(descreption: "Start of American Civil War", year: 1861, month: 4, day: 12, website: "https://en.wikipedia.org/wiki/American_Civil_War"),
    HistoryEvent(descreption: "Start of World War I", year: 1914, month: 7, day: 28, website: "https://en.wikipedia.org/wiki/World_War_I"),
    HistoryEvent(descreption: "Start of American Revolution", year: 1775, month: 4, day: 19, website: "https://en.wikipedia.org/wiki/American_Revolution"),
    HistoryEvent(descreption: "The birth date of George Washington", year: 1732, month: 2, day: 22, website: "https://en.wikipedia.org/wiki/George_Washington"),
    HistoryEvent(descreption: "The birth date of Henry Ford", year: 1863, month: 7, day: 30, website: "https://en.wikipedia.org/wiki/Henry_Ford"),
    HistoryEvent(descreption: "Start of the Great Depression", year: 1929, month: 10, day: 29, website: "https://en.wikipedia.org/wiki/Great_Depression"),
    HistoryEvent(descreption: "Apollo 11 lauch date", year: 1969, month: 7, day: 16, website: "https://en.wikipedia.org/wiki/Apollo_11"),
    HistoryEvent(descreption: "The day that tearing down of the Berlin Wall", year: 1989, month: 11, day: 9, website: "https://en.wikipedia.org/wiki/Berlin_Wall"),
    HistoryEvent(descreption: "Date of the attack on Pearl Harbor", year: 1941, month: 12, day: 7, website: "https://en.wikipedia.org/wiki/Attack_on_Pearl_Harbor"),
    HistoryEvent(descreption: "Date of John F. Kennedy assassination", year: 1963, month: 11, day: 22, website: "https://en.wikipedia.org/wiki/Assassination_of_John_F._Kennedy"),
    HistoryEvent(descreption: "Date of Dissolution of the Soviet Union", year: 1991, month: 12, day: 26, website: "https://en.wikipedia.org/wiki/Dissolution_of_the_Soviet_Union"),
    HistoryEvent(descreption: "Date of Invasion of Normandy", year: 1944, month: 6, day: 6, website: "https://en.wikipedia.org/wiki/Invasion_of_Normandy"),
    HistoryEvent(descreption: "Date of Victory in Europe Day", year: 1945, month: 5, day: 8, website: "https://en.wikipedia.org/wiki/Victory_in_Europe_Day"),
    HistoryEvent(descreption: "Start of Cuban Missile Crisis", year: 1962, month: 10, day: 16, website: "https://en.wikipedia.org/wiki/Cuban_Missile_Crisis"),
    HistoryEvent(descreption: "Start of October Revolution", year: 1917, month: 11, day: 7, website: "https://en.wikipedia.org/wiki/October_Revolution"),
    HistoryEvent(descreption: "Date of Sinking of the Titanic", year: 1912, month: 4, day: 15, website: "https://en.wikipedia.org/wiki/Sinking_of_the_RMS_Titanic"),
    HistoryEvent(descreption: "Start of French Revolution", year: 1789, month: 5, day: 5, website: "https://en.wikipedia.org/wiki/French_Revolution"),
    HistoryEvent(descreption: "Date of Queen Victoria's Funeral", year: 1901, month: 2, day: 2, website: "https://en.wikipedia.org/wiki/Funeral_of_Queen_Victoria"),
    HistoryEvent(descreption: "Date of Wright Brother's First Flight", year: 1903, month: 12, day: 17, website: "https://en.wikipedia.org/wiki/Wright_brothers"),
    HistoryEvent(descreption: "Date of Mao's Communists Take Over China", year: 1949, month: 10, day: 1, website: "https://en.wikipedia.org/wiki/Chinese_Communist_Revolution"),
    HistoryEvent(descreption: "Date of Armstrong Sets Foot on the Moon", year: 1969, month: 7, day: 21, website: "https://en.wikipedia.org/wiki/Apollo_11"),
    HistoryEvent(descreption: "Date of Germans surrender to Montgomery", year: 1945, month: 5, day: 7, website: "https://en.wikipedia.org/wiki/German_surrender_at_L%C3%BCneburg_Heath")
]




















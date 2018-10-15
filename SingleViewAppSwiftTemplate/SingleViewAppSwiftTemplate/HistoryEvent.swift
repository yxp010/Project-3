//
//  Buttons.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/11/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

//protocol Button {
//    var direction: buttonDirection? { get set }
//    var buttonImage: UIImage { get }
//    var secondButtonImage: UIImage { get }
//}
//
//
//class UpDownButtons: Button {
//    var direction: buttonDirection? = nil
//    var buttonImage: UIImage
//    var secondButtonImage: UIImage
//
//    init(image1: UIImage, image2: UIImage) {
//        buttonImage = image1
//        secondButtonImage = image2
//    }
//}

class HistoryEvent: Equatable {
    let descreption: String
    let year: Int
    let month: Int
    let day: Int
    
    init(descreption: String, year: Int, month: Int, day: Int) {
        self.descreption = descreption
        self.year = year
        self.month = month
        self.day = day
        
    }
    static func ==(lhs: HistoryEvent, rhs: HistoryEvent) -> Bool {
        return lhs.descreption == rhs.descreption
    }
    
}


let events = [
    HistoryEvent(descreption: "Start of World War II", year: 1939, month: 9, day: 1),
    HistoryEvent(descreption: "Start of Vietnam War", year: 1955, month: 11, day: 1),
    HistoryEvent(descreption: "Start of Korean War", year: 1950, month: 6, day: 25),
    HistoryEvent(descreption: "Start of American Civil War", year: 1861, month: 4, day: 12),
    HistoryEvent(descreption: "Start of World War I", year: 1914, month: 7, day: 28),
    HistoryEvent(descreption: "Start of American Revolution", year: 1775, month: 4, day: 19),
    HistoryEvent(descreption: "The birth date of George Washington", year: 1732, month: 2, day: 22),
    HistoryEvent(descreption: "The birth date of Henry Ford", year: 1863, month: 7, day: 30),
    HistoryEvent(descreption: "Start of the Great Depression", year: 1929, month: 10, day: 29),
    HistoryEvent(descreption: "Apollo 11 lauch date", year: 1969, month: 7, day: 16),
    HistoryEvent(descreption: "The day that tearing down of the Berlin Wall", year: 1989, month: 11, day: 9),
    HistoryEvent(descreption: "Date of the attack on Pearl Harbor", year: 1941, month: 12, day: 7),
    HistoryEvent(descreption: "Date of John F. Kennedy assassination", year: 1963, month: 11, day: 22),
    HistoryEvent(descreption: "Date of Dissolution of the Soviet Union", year: 1991, month: 12, day: 26),
    HistoryEvent(descreption: "Date of Invasion of Normandy", year: 1944, month: 6, day: 6),
    HistoryEvent(descreption: "Date of Victory in Europe Day", year: 1945, month: 5, day: 8),
    HistoryEvent(descreption: "Start of Cuban Missile Crisis", year: 1962, month: 10, day: 16),
    HistoryEvent(descreption: "Start of October Revolution", year: 1917, month: 11, day: 7),
    HistoryEvent(descreption: "Date of Sinking of the Titanic", year: 1912, month: 4, day: 15),
    HistoryEvent(descreption: "Start of French Revolution", year: 1789, month: 5, day: 5),
    HistoryEvent(descreption: "Date of Queen Victoria's Funeral", year: 1901, month: 2, day: 2),
    HistoryEvent(descreption: "Date of Wright Brother's First Flight", year: 1903, month: 12, day: 17),
    HistoryEvent(descreption: "Date of Mao's Communists Take Over China", year: 1949, month: 10, day: 1),
    HistoryEvent(descreption: "Date of Armstrong Sets Foot on the Moon", year: 1969, month: 7, day: 21),
    HistoryEvent(descreption: "Date of Germans surrender to Montgomery", year: 1945, month: 5, day: 7)
]




















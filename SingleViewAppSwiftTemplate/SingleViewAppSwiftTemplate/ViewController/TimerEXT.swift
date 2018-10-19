//
//  Timer.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/19/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

extension ViewController {
    // TimerField set up
    func setupTimerField() {
        timerField.numberOfLines = 0
        timerField.textAlignment = .center
        timerField.textColor = .white
        timerField.translatesAutoresizingMaskIntoConstraints = false
        timerField.font = UIFont.boldSystemFont(ofSize: 35)
        view.addSubview(timerField)
        timerField.topAnchor.constraint(equalTo: allOptionContainer.bottomAnchor, constant: 20).isActive = true
        timerField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        timerField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        timerField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    // Start Timer
    func loadTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    // Function for timer use each second
    func countDown() {
        secondsOnTimer -= 1
        timerField.text = "0:\(secondsOnTimer)"
        if secondsOnTimer == 0 {
            checkAnswer()
        }
    }
}

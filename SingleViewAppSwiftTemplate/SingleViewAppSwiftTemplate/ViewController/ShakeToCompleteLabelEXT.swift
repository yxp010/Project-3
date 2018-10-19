//
//  ShakeToCompleteLabel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/19/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit
extension ViewController {
    // Set up shake to complete indicator text label under timer
    func setupShakeToCompleteIndicatorLabel() {
        shakeToCompleteIndicator.textAlignment = .center
        shakeToCompleteIndicator.numberOfLines = 0
        shakeToCompleteIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(shakeToCompleteIndicator)
        
        shakeToCompleteIndicator.heightAnchor.constraint(equalToConstant: 22).isActive = true
        shakeToCompleteIndicator.widthAnchor.constraint(equalTo: timerField.widthAnchor).isActive = true
        shakeToCompleteIndicator.textColor = .indicatorTextColor
        shakeToCompleteIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        shakeToCompleteIndicator.topAnchor.constraint(equalTo: timerField.bottomAnchor, constant: 5).isActive = true
    }
}

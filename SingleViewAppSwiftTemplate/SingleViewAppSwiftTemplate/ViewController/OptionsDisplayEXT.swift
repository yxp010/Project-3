//
//  FourOptionContainerAndButtons.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/18/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    // MARK: - Containers for Reference and Switch Buttons
    
    func setupAllOpitonsContainer() {
        groupingContainers()
        allOptionContainer = UIStackView(arrangedSubviews: optionContainerArray)
        allOptionContainer.distribution = .fillEqually
        allOptionContainer.axis = .vertical
        allOptionContainer.spacing = 12
        allOptionContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(allOptionContainer)
        allOptionContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        allOptionContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        allOptionContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        allOptionContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
    }
    
    // MARK: - Reference Buttons
    func setupReferenceButton() {
        for (index, container) in optionContainerArray.enumerated() {
            container.addSubview(referenceButtonArray[index])
            referenceButtonArray[index].adjustsImageWhenDisabled = false
            referenceButtonArray[index].leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
            referenceButtonArray[index].topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            referenceButtonArray[index].bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
            referenceButtonArray[index].widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.85).isActive = true
            referenceButtonArray[index].titleLabel?.numberOfLines = 0
            referenceButtonArray[index].setTitleColor(UIColor.backGroundColor, for: .normal)
            referenceButtonArray[index].backgroundColor = .white
            referenceButtonArray[index].titleLabel?.textAlignment = .center
        }
    }
    
    func openWeb(_ sender: UIButton) {
        webViewContainer.isHidden = false
        for (index,button) in referenceButtonArray.enumerated() {
            if sender == button {
                urlString = quizManager.currentRoundEvents[index].website
            }
        }
        let myURL = URL(string: urlString)
        let myRequest = URLRequest(url: myURL!)
        webpageView.load(myRequest)
    }
    
    // MARK: - Switch Buttons
    func setupSwitchButtons() {
        groupingContainers()
        for (index, container) in optionContainerArray.enumerated() {
            for (buttonIndex,button) in switchButtonContainerArray[index].enumerated() {
                container.addSubview(button)
                button.adjustsImageWhenDisabled = false
                // Use if statement to check to how many buttons in array, so we can set up different layout.
                if switchButtonContainerArray[index].count > 1 {
                    if buttonIndex > 0 {
                        button.topAnchor.constraint(equalTo: switchButtonContainerArray[index][buttonIndex - 1].bottomAnchor).isActive = true
                        button.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
                        button.leadingAnchor.constraint(equalTo: referenceButtonArray[index].trailingAnchor).isActive = true
                        button.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
                        continue
                    }
                    button.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
                    button.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5).isActive = true
                    button.leadingAnchor.constraint(equalTo: referenceButtonArray[index].trailingAnchor).isActive = true
                    button.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
                    
                }
                button.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
                button.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
                button.leadingAnchor.constraint(equalTo: referenceButtonArray[index].trailingAnchor).isActive = true
                button.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
            }
        }
    }
    
    // Switch two texts depending on which button is the sender.
    func switchTexts(by sender: UIButton) {
        if sender == button1 || sender == button2Up {
            quizManager.currentRoundEvents.swapAt(0, 1)
            referenceButton1.setTitle(quizManager.currentRoundEvents[0].descreption, for: .normal)
            referenceButton2.setTitle(quizManager.currentRoundEvents[1].descreption, for: .normal)
        } else if sender == button2Down || sender == button3Up {
            quizManager.currentRoundEvents.swapAt(1, 2)
            referenceButton2.setTitle(quizManager.currentRoundEvents[1].descreption, for: .normal)
            referenceButton3.setTitle(quizManager.currentRoundEvents[2].descreption, for: .normal)
        } else {
            quizManager.currentRoundEvents.swapAt(2, 3)
            referenceButton3.setTitle(quizManager.currentRoundEvents[2].descreption, for: .normal)
            referenceButton4.setTitle(quizManager.currentRoundEvents[3].descreption, for: .normal)
        }
    }
}

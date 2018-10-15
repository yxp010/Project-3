//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

extension UIColor {
    static var backGroundColor = UIColor(red: 8/255, green: 41/255, blue: 72/255, alpha: 1)
    static var indicatorTextColor = UIColor(red: 76/255, green: 143/255, blue: 177/255, alpha: 1)
}

class ViewController: UIViewController {
    var optionHight = 100
    var textFieldWidth = 300
    let buttonWidth = 50
    var timer: Timer?
    var initialTimer = 60
    var secondsOnTimer = 60
    var timerField = UILabel()
    var shakeToCompleteIndicator = UILabel()
    let quizManager = QuizManager(allEvents: events)
    var answer = true
    var textFieldArray = [UILabel]()
    var buttonContainerArray = [[UIButton]]()
    var buttonAndTextFieldContainerArray = [UIView]()
    
    var nextRoundButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextRound), for: .touchUpInside)
        return button
    }()
    
    
    func loadTiemrField(secondsOnTimer: Int) {
        timerField.text = "0:\(secondsOnTimer)"
        timerField.numberOfLines = 0
        timerField.textAlignment = .center
        timerField.textColor = .white
        timerField.translatesAutoresizingMaskIntoConstraints = false
        timerField.font = UIFont.boldSystemFont(ofSize: 35)
    }
    
    // option containers
    let container1: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 7
        container.layer.masksToBounds = true
        return container
    }()
    
    let container2: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 7
        container.layer.masksToBounds = true
        return container
    }()
    let container3: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 7
        container.layer.masksToBounds = true
        return container
    }()
    let container4: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 7
        container.layer.masksToBounds = true
        return container
    }()
    
    
    
    var button1: UIButton = {
        var button = UIButton()
        button.setImage(#imageLiteral(resourceName: "down_full"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "down_full_selected"), for: .highlighted)
        button.addTarget(self, action: #selector(switchTexts), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var button2Up: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "up_half"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
        button.addTarget(self, action: #selector(switchTexts), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var button2Down: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "down_half"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
        button.addTarget(self, action: #selector(switchTexts), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var button3Up: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "up_half"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
        button.addTarget(self, action: #selector(switchTexts), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var button3Down: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "down_half"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
        button.addTarget(self, action: #selector(switchTexts), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var button4: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "up_full"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "up_full_selected"), for: .highlighted)
        button.addTarget(self, action: #selector(switchTexts), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let text1: UILabel = {
        let text = UILabel()
        text.text = "1"
        text.numberOfLines = 0
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    let text2: UILabel = {
        let text = UILabel()
        text.text = "2"
        text.numberOfLines = 0
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        
        return text
    }()
    let text3: UILabel = {
        let text = UILabel()
        text.text = "3"
        text.numberOfLines = 0
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    let text4: UILabel = {
        let text = UILabel()
        text.text = "4"
        text.numberOfLines = 0
        text.textAlignment = .center
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backGroundColor
        groupingContainers()
        loadTiemrField(secondsOnTimer: initialTimer)
        startNewGame()

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    // score display
    var scoreContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    var scoreText: UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        text.numberOfLines = 0
        text.text = "You Score"
        text.font = UIFont.systemFont(ofSize: 20)
        text.textColor = .indicatorTextColor
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    var scoreNumber: UILabel = {
        let score = UILabel()
        score.textAlignment = .center
        score.textColor = .white
        score.numberOfLines = 0
        score.translatesAutoresizingMaskIntoConstraints = false
        return score
    }()
    var playAgainButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "play_again"), for: .normal)
        button.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupScoreDisplay() {
        view.addSubview(scoreContainer)
        scoreContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        scoreContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        scoreContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        scoreContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
        // add views to score container
        setupScoreTextLayout()
        setupScoreNumberLayout()
        setupPlayAgainButtonLayout()
        
    }
    func setupPlayAgainButtonLayout() {
        scoreContainer.addSubview(playAgainButton)
        playAgainButton.topAnchor.constraint(equalTo: scoreNumber.bottomAnchor, constant: 75).isActive = true
        playAgainButton.leadingAnchor.constraint(equalTo: scoreContainer.leadingAnchor, constant: 33).isActive = true
        playAgainButton.trailingAnchor.constraint(equalTo: scoreContainer.trailingAnchor, constant: -33).isActive = true
        playAgainButton.bottomAnchor.constraint(equalTo: scoreContainer.bottomAnchor).isActive = true
        
    }
    func setupScoreNumberLayout() {
        scoreContainer.addSubview(scoreNumber)
        scoreNumber.topAnchor.constraint(equalTo: scoreText.bottomAnchor).isActive = true
        scoreNumber.leadingAnchor.constraint(equalTo: scoreContainer.leadingAnchor).isActive = true
        scoreNumber.trailingAnchor.constraint(equalTo: scoreContainer.trailingAnchor).isActive = true
        scoreNumber.heightAnchor.constraint(equalToConstant: 70).isActive = true
        scoreNumber.font = UIFont.systemFont(ofSize: 60)
    }
    
    func setupScoreTextLayout() {
        scoreContainer.addSubview(scoreText)
        scoreText.topAnchor.constraint(equalTo: scoreContainer.topAnchor).isActive = true
        scoreText.leadingAnchor.constraint(equalTo: scoreContainer.leadingAnchor).isActive = true
        scoreText.trailingAnchor.constraint(equalTo: scoreContainer.trailingAnchor).isActive = true
        scoreText.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    // Group text label, containers, and button containers.
    func groupingContainers() {
        textFieldArray = [text1, text2, text3, text4]
        buttonAndTextFieldContainerArray = [container1, container2, container3, container4]
        buttonContainerArray = [[button1], [button2Up, button2Down], [button3Up, button3Down], [button4]]
    }
    
    // stack view container for 4 options.
    var allOptionContainer = UIStackView()
    func setupAllOpitonsContainer() {
        groupingContainers()
        allOptionContainer = UIStackView(arrangedSubviews: buttonAndTextFieldContainerArray)
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
    // TimerField set up
    func setupTimerField() {
        view.addSubview(timerField)
        timerField.topAnchor.constraint(equalTo: allOptionContainer.bottomAnchor, constant: 20).isActive = true
        timerField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        timerField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        timerField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    // Next round button set up
    func setupNextRoundButton() {
        view.addSubview(nextRoundButton)
        nextRoundButton.isHidden = true
        nextRoundButton.topAnchor.constraint(equalTo: allOptionContainer.bottomAnchor, constant: 20).isActive = true
        nextRoundButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextRoundButton.widthAnchor.constraint(equalToConstant: 170).isActive = true
        nextRoundButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    // up and down control button set up
    func setupUpAndDownControlButton() {
        groupingContainers()
        for (index, container) in buttonAndTextFieldContainerArray.enumerated() {
            container.addSubview(textFieldArray[index])
            
            textFieldArray[index].leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
            textFieldArray[index].topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            textFieldArray[index].bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
            textFieldArray[index].widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.85).isActive = true
            for (buttonIndex,button) in buttonContainerArray[index].enumerated() {
                container.addSubview(button)
                if buttonContainerArray[index].count > 1 {
                    if buttonIndex > 0 {
                        button.topAnchor.constraint(equalTo: buttonContainerArray[index][buttonIndex - 1].bottomAnchor).isActive = true
                        button.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
                        button.leadingAnchor.constraint(equalTo: textFieldArray[index].trailingAnchor).isActive = true
                        button.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
                        continue
                    }
                    button.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
                    button.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5).isActive = true
                    button.leadingAnchor.constraint(equalTo: textFieldArray[index].trailingAnchor).isActive = true
                    button.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
                    
                }
                button.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
                button.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
                button.leadingAnchor.constraint(equalTo: textFieldArray[index].trailingAnchor).isActive = true
                button.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
            }
        }
    }
    
    // Set up the layout of shake to complete indicator label.
    func setupShakeToCompleteIndicatorLabel() {
        shakeToCompleteIndicator.text = "Shake to complete"
        //        shakeToCompleteIndicator.backgroundColor = .black
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
    func display(allOptionContainerIsHidden: Bool? = nil, timerFieldIsHidden: Bool? = nil, nextRoundButtonIsHidden: Bool? = nil, shakeToCompleteLabelIsHidden: Bool? = nil, scoreDisplayIsHidden: Bool? = nil, buttonsEnabled: Bool? = nil) {
        
        setupAllOpitonsContainer()
        setupTimerField()
        setupNextRoundButton()
        setupUpAndDownControlButton()
        setupShakeToCompleteIndicatorLabel()
        setupScoreDisplay()
        
        if let buttonsEnabledOrNot = buttonsEnabled {
            for buttons in buttonContainerArray {
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
        
    }
    
    // Up and Down direction button function.
    func switchTextOneAndTwo() {
        quizManager.currentRoundEvents.swapAt(0, 1)
        let temporaryText = text1.text
        text1.text = text2.text
        text2.text = temporaryText

    }
    func switchTextTwoAndThree() {
        quizManager.currentRoundEvents.swapAt(1, 2)
        let temporaryText = text2.text
        text2.text = text3.text
        text3.text = temporaryText

    }
    func switchTextThreeAndFour() {
        quizManager.currentRoundEvents.swapAt(2, 3)
        let temporaryText = text3.text
        text3.text = text4.text
        text4.text = temporaryText

    }
    
    // Action function use UIButton as parameter "sender" to give to each up/down buttons to behave differently depends on the situation.
    @objc func switchTexts(by sender: UIButton) {
        if sender == button1 || sender == button2Up {
            switchTextOneAndTwo()
        } else if sender == button2Down || sender == button3Up {
            switchTextTwoAndThree()
        } else {
            switchTextThreeAndFour()
        }
    }
    
    func loadTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    func countDown() {
        secondsOnTimer -= 1
        timerField.text = "0:\(secondsOnTimer)"
        timeOut()
    }
    func checkAnswer() {
        quizManager.roundsPlayed += 1
        answer = quizManager.checkAnswer()
        if answer == true {
            nextRoundButton.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
            quizManager.correctAnswer += 1
        } else {
            nextRoundButton.setImage(#imageLiteral(resourceName: "next_round_fail"), for: .normal)
        }
    }
    @objc func nextRound() {
        
        if quizManager.roundsPlayed == quizManager.totalRounds {
            display(allOptionContainerIsHidden: true, nextRoundButtonIsHidden: true, shakeToCompleteLabelIsHidden: true, scoreDisplayIsHidden: false)
        } else {
            display(timerFieldIsHidden: false, nextRoundButtonIsHidden: true, buttonsEnabled: true)
            quizManager.createNextRoundEvents()
            quizManager.correctOrderOfEvents()
            loadEventsOnTextFields()
        }
        

    }
    func loadEventsOnTextFields() {
        for (index,textField) in textFieldArray.enumerated() {
            textField.text = quizManager.currentRoundEvents[index].descreption
        }
    }
    
    // Start New Game
    func startNewGame() {
        display(allOptionContainerIsHidden: false, shakeToCompleteLabelIsHidden: false, scoreDisplayIsHidden: true)
        resetGameData()
        quizManager.createEvents()
        nextRound()
    }
    func resetGameData() {
        quizManager.correctAnswer = 0
        quizManager.roundsPlayed = 0
        quizManager.eventsIndexes = [Int]()
        quizManager.selectedHistoryEventsForEntireGame = [HistoryEvent]()
    }
    
    // Shake Phone
    func shakePhone() {
//        if shakePhone {
//            if correct {
//                nextRoundSuccessButton.isHidden = false
//            } else {
//                nextRoundFailButton.isHidden = false
//
//            }
//            shakeToCompleteIndicator.text = "Type events to learn more"
//        }
    }
    func timeOut() {
        if secondsOnTimer == 0 {
            checkAnswer()
            display(timerFieldIsHidden: true, nextRoundButtonIsHidden: false, buttonsEnabled: false)
            timer?.invalidate()
            shakeToCompleteIndicator.text = "Type events to learn more"
        }
    }
}


























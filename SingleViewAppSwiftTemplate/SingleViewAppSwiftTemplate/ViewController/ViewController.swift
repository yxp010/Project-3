//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import WebKit
import AudioToolbox

extension UIColor {
    static var backGroundColor = UIColor(red: 8/255, green: 41/255, blue: 72/255, alpha: 1)
    static var indicatorTextColor = UIColor(red: 76/255, green: 143/255, blue: 177/255, alpha: 1)
    static var webbarBackGroundColor = UIColor(red: 242/255, green: 152/255, blue: 55/255, alpha: 1)
}

class ViewController: UIViewController {
    // MARK: - Properties
    var timer: Timer?
    let initialTimer = 60
    var secondsOnTimer = 60
    var timerField = UILabel()
    var shakeToCompleteIndicator = UILabel()
    let quizManager = QuizManager(allEvents: events)
    var answer = true
    var referenceButtonArray = [UIButton]()
    var switchButtonContainerArray = [[UIButton]]()
    var optionContainerArray = [UIView]()
    var roundIsEnd = true
    var urlString: String = ""
    
    // MARK: - Loding views
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
        startNewGame()
    }
    
    // All Views Loading Function
    func loadViews() {
        view.backgroundColor = UIColor.backGroundColor
        groupingContainers()
        setupAllOpitonsContainer()
        setupReferenceButton()
        setupSwitchButtons()
        setupTimerField()
        setupNextRoundButton()
        setupShakeToCompleteIndicatorLabel()
        setupScoreDisplay()
        setupWebView()
    }
    
    // MARK: - View Objects
    
    // Web View Objects
    var webViewContainer = UIView()
    var webViewBar = UIImageView(image: #imageLiteral(resourceName: "webview_bar"))
    var webpageView = WKWebView()
    var closeWebButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeWebView), for: .touchUpInside)
        return button
    }()
    
    // Stack View Container Objecrt
    var allOptionContainer = UIStackView()
    
    // Container Objects for Reference Button and Switch Button
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
    
    //Reference Buttons
    let referenceButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openWeb(_:)), for: .touchUpInside)
        return button
    }()
    
    let referenceButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openWeb(_:)), for: .touchUpInside)
        return button
    }()
    
    let referenceButton3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openWeb(_:)), for: .touchUpInside)
        return button
    }()
    
    let referenceButton4: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openWeb(_:)), for: .touchUpInside)
        return button
    }()
    
    // Switch Button Objects
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
    
    // Next Round Button Object
    var nextRoundButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextRound), for: .touchUpInside)
        return button
    }()
    
    // Score Display Objects
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
    
    // Play Again Button Object
    var playAgainButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "play_again"), for: .normal)
        button.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Sound Effects
    var correctDing: SystemSoundID = {
        var sound = SystemSoundID()
        let path = Bundle.main.path(forResource: "CorrectDing", ofType: "wav", inDirectory: "AudioClips")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &sound)
        return sound
    }()
    
    var IncorrectBuzz: SystemSoundID = {
        var sound = SystemSoundID()
        let path = Bundle.main.path(forResource: "IncorrectBuzz", ofType: "wav", inDirectory: "AudioClips")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &sound)
        return sound
    }()
    
    
    
    // MARK: - Helper Function
    
    // Function that Grouping reference buttons, containers, and button containers.
    func groupingContainers() {
        referenceButtonArray = [referenceButton1, referenceButton2, referenceButton3, referenceButton4]
        optionContainerArray = [container1, container2, container3, container4]
        switchButtonContainerArray = [[button1], [button2Up, button2Down], [button3Up, button3Down], [button4]]
    }
    
    // Hand Shake Motion that invokes 'checkAnswer' function.
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        // This will only effective while a round is currently playing. 'roundIsEnd' will be assigned true after 'checkAnswer', and assigned false after new round of game starts.
        if motion == .motionShake && roundIsEnd == false {
            checkAnswer()
        }
    }
    
    // This function calls 'quizManager.checkAnswer()' to check if the user has correct answer, and assign it to 'answer'.
    // Depending on 'answer' is true or not, the function will help application to behave differently.
    func checkAnswer() {
        quizManager.roundsPlayed += 1
        answer = quizManager.checkAnswer()
        if answer == true {
            nextRoundButton.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
            quizManager.correctAnswer += 1
            AudioServicesPlaySystemSound(correctDing)
        } else {
            nextRoundButton.setImage(#imageLiteral(resourceName: "next_round_fail"), for: .normal)
            AudioServicesPlaySystemSound(IncorrectBuzz)
        }
        timer?.invalidate()
        display(timerFieldIsHidden: true, nextRoundButtonIsHidden: false, buttonsEnabled: false, referenceButtonEnabled: true)
        shakeToCompleteIndicator.text = "Type events to learn more"
        roundIsEnd = true
    }
}

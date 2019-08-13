//
//  ScoreViewController.swift
//  BooksQuiz
//
//  Created by Александр Шубский on 02/08/2019.
//  Copyright © 2019 Александр Шубский. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var sessionRightAnswersCount: UILabel!
    @IBOutlet weak var totalRightAnswersCount: UILabel!
    @IBOutlet weak var sessionWrongAnswersCount: UILabel!
    @IBOutlet weak var totalWrongAnswersCount: UILabel!
    
    @IBOutlet weak var sessionRightAnswers: UILabel!
    @IBOutlet weak var totalRightAnswers: UILabel!
    @IBOutlet weak var sessionWrongAnswers: UILabel!
    @IBOutlet weak var totalWrongAnswers: UILabel!
    
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        sessionRightAnswersCount.text = "0"
        totalRightAnswersCount.text = "0"
        sessionWrongAnswersCount.text = "0"
        totalWrongAnswersCount.text = "0"
        Score.gameRightAnswers = nil
        Score.sessionRightAnswers = nil
        Score.gameWrongAnswers = nil
        Score.sessionlWrongAnswers = nil
    }
    
    @IBAction func homeScoreButton(_ sender: UIButton) {
    }
    
    
    func check() {
        if Score.gameRightAnswers == nil {
            sessionRightAnswersCount.text = "0"
        } else {
            sessionRightAnswersCount.text = "\(Score.gameRightAnswers!)"
            Score.gameRightAnswers = 0
        }
        
        if Score.sessionRightAnswers == nil {
            totalRightAnswersCount.text = "0"
        } else {
            totalRightAnswersCount.text = "\(Score.sessionRightAnswers!)"
        }
        
        if Score.gameWrongAnswers == nil {
            sessionWrongAnswersCount.text = "0"
        } else {
            sessionWrongAnswersCount.text = "\(Score.gameWrongAnswers!)"
            Score.gameWrongAnswers = 0
        }
        
        if Score.sessionlWrongAnswers == nil {
            totalWrongAnswersCount.text = "0"
        } else {
            totalWrongAnswersCount.text = "\(Score.sessionlWrongAnswers!)"
        }
    }
    
    
    func localizationChoiceScore() {
        
        switch Locale.preferredLanguages[0].prefix(2) == "ru"{
        case true:
            check()
            homeButton.setTitle("〈 ДОМОЙ", for: .normal)
            resetButton.setTitle("СБРОС ↺", for: .normal)
            sessionRightAnswers.text = "Правильных ответов за игру"
            totalRightAnswers.text = "Правильных ответов за сессию"
            sessionWrongAnswers.text = "Неправильных ответов за игру"
            totalWrongAnswers.text = "Неправильных ответов за сессию"
            
            
        case false:
            check()
            homeButton.setTitle("〈 HOME", for: .normal)
            resetButton.setTitle("RESET ↺", for: .normal)
            sessionRightAnswers.text = "Right answers per game"
            totalRightAnswers.text = "Right answers per session"
            sessionWrongAnswers.text = "Wrong answers per game"
            totalWrongAnswers.text = "wrong answers per session"
            
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localizationChoiceScore()
        
    }
    
    
    
}

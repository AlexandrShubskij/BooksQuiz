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
        Score.sessionRightAnswers = nil
        Score.totalRightAnswers = nil
        Score.sessionWrongAnswers = nil
        Score.totalWrongAnswers = nil
    }
    
    @IBAction func homeScoreButton(_ sender: UIButton) {
    }
    
    
    func check() {
        if Score.sessionRightAnswers == nil {
            sessionRightAnswersCount.text = "0"
        } else {
            sessionRightAnswersCount.text = "\(Score.sessionRightAnswers!)"
            Score.sessionRightAnswers = 0
        }
        
        if Score.totalRightAnswers == nil {
            totalRightAnswersCount.text = "0"
        } else {
            totalRightAnswersCount.text = "\(Score.totalRightAnswers!)"
        }
        
        if Score.sessionWrongAnswers == nil {
            sessionWrongAnswersCount.text = "0"
        } else {
            sessionWrongAnswersCount.text = "\(Score.sessionWrongAnswers!)"
            Score.sessionWrongAnswers = 0
        }
        
        if Score.totalWrongAnswers == nil {
            totalWrongAnswersCount.text = "0"
        } else {
            totalWrongAnswersCount.text = "\(Score.totalWrongAnswers!)"
        }
    }
    
    
    func localizationChoiceScore() {
        
        switch Locale.preferredLanguages[0].prefix(2) == "ru"{
        case true:
            check()
            homeButton.setTitle("〈 ДОМОЙ", for: .normal)
            resetButton.setTitle("СБРОС ↺", for: .normal)
            sessionRightAnswers.text = "Правильных ответов за сессию"
            totalRightAnswers.text = "Правильных ответов всего"
            sessionWrongAnswers.text = "Неправильных ответов за сессию"
            totalWrongAnswers.text = "Неправильных ответов всего"
            
            
        case false:
            check()
            homeButton.setTitle("〈 HOME", for: .normal)
            resetButton.setTitle("RESET ↺", for: .normal)
            sessionRightAnswers.text = "Right answers per session"
            totalRightAnswers.text = "Total right answers"
            sessionWrongAnswers.text = "Wrong answers per session"
            totalWrongAnswers.text = "Total wrong answers"
            
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localizationChoiceScore()
        
    }
    
    
    
}

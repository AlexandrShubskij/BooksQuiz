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
        Score.sessionRightAnswers = 0
        Score.sessionWrongAnswers = 0
        UserDefaults.standard.set(0, forKey: "TRA")
        UserDefaults.standard.set(0, forKey: "TWA")
    }
    
    @IBAction func homeScoreButton(_ sender: UIButton) {
    }
    
    
    
    func localizationChoiceScore() {
        
        switch Locale.preferredLanguages[0].prefix(2) == "ru"{
        case true:

            homeButton.setTitle("〈 ДОМОЙ", for: .normal)
            resetButton.setTitle("СБРОС ↺", for: .normal)
            sessionRightAnswers.text = "Правильных ответов за сессию"
            totalRightAnswers.text = "Правильных ответов всего"
            sessionWrongAnswers.text = "Неправильных ответов за сессию"
            totalWrongAnswers.text = "Неправильных ответов всего"
            totalRightAnswersCount.text = "\(UserDefaults.standard.integer(forKey: "TRA"))"
            sessionRightAnswersCount.text = "\(Score.sessionRightAnswers)"
            totalWrongAnswersCount.text = "\(UserDefaults.standard.integer(forKey: "TWA"))"
            sessionWrongAnswersCount.text = "\(Score.sessionWrongAnswers)"
            
            
        case false:
            homeButton.setTitle("〈 HOME", for: .normal)
            resetButton.setTitle("RESET ↺", for: .normal)
            sessionRightAnswers.text = "Right answers per session"
            totalRightAnswers.text = "Total right answers"
            sessionWrongAnswers.text = "Wrong answers per session"
            totalWrongAnswers.text = "Total wrong answers"
            totalRightAnswersCount.text = "\(UserDefaults.standard.integer(forKey: "TRA"))"
            sessionRightAnswersCount.text = "\(Score.sessionRightAnswers)"
            totalWrongAnswersCount.text = "\(UserDefaults.standard.integer(forKey: "TWA"))"
            sessionWrongAnswersCount.text = "\(Score.sessionWrongAnswers)"
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localizationChoiceScore()
        
    }
    
    
    
}

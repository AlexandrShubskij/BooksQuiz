//
//  QuestionViewController.swift
//  BooksQuiz
//
//  Created by Александр Шубский on 02/08/2019.
//  Copyright © 2019 Александр Шубский. All rights reserved.
//

import UIKit
import Foundation

class QuestionViewController: UIViewController, UITextFieldDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createQuestionsList()
        questionsAndAnswersUI()
        localizationChoiceQuestion()
        answerField.delegate = self
        homeButton.isHidden = true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        answerField.text = ""
        return false
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
<<<<<<< HEAD
    //    @IBOutlet weak var answerField: UITextField!
=======
>>>>>>> newFeature
    @IBOutlet weak var answerField: ShakingTextField!
    
    @IBOutlet weak var answerButton: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    
    
    @IBAction func answerButton(_ sender: UIButton) {
    }
    
    @IBAction func unwindToQuestionPage(segue: UIStoryboardSegue){
        if sendetQuestionsList.count > 0 {
            questionsAndAnswersUI()
            homeButton.isHidden = true
        } else {
            switch Locale.preferredLanguages[0].prefix(2) == "ru"{
            case true:
                questionLabel.text = "ВЫ ОТВЕТИЛИ НА ВСЕ ВОПРОСЫ"
                homeButton.setTitle("〈 ДОМОЙ", for: .normal)
            case false:
                questionLabel.text = "YOU ANSWERED ALL THE QUESTIONS"
                homeButton.setTitle("〈 HOME", for: .normal)
            }
            answerButton.isHidden = true
            answerField.isHidden = true
            homeButton.isHidden = false
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if answerField.isHidden == true {
            return true
        } else if answerField.text?.isEmpty == true {
            answerField.shake()
            return false
        } else {
            return true
        }
        
    }
    
    var sendetQuestionsList = [String]()
    
    var questionValue : String = ""
    
    
    func createQuestionsList(){
        switch Locale.preferredLanguages[0].prefix(2) == "ru"{
        case true:
            for questions in QuestionsRU.questionsAndAnswersRuList.keys {
                sendetQuestionsList.append(questions)
            }
        case false:
            for questions in QuestionsEN.questionsAndAnswersEnList.keys {
                sendetQuestionsList.append(questions)
            }
        }
    }
    
    func randomQuestion() -> Int{
        return(Int.random(in: 0..<sendetQuestionsList.count))
    }
    
    func localizationChoiceQuestion() {
        
        switch Locale.preferredLanguages[0].prefix(2) == "ru"{
        case true:
            answerButton.setTitle("ОТВЕТ", for: .normal)
            answerField.placeholder = "Пишите Ваш ответ здесь"
        case false:
            answerButton.setTitle("ANSWER", for: .normal)
            answerField.placeholder = "Write your answer here"
        }
    }
    
    let vc = (UIStoryboard(name: "Main", bundle: nil)).instantiateViewController(withIdentifier: "ScoreViewController") as? ScoreViewController
    
    func questionsAndAnswersUI(){
        let index = randomQuestion()
        questionLabel.text = sendetQuestionsList[index]
        questionValue = sendetQuestionsList[index]
        sendetQuestionsList.remove(at: index)
        self.view.window?.rootViewController = vc
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? ResultViewController else { return }
        
        switch Locale.preferredLanguages[0].prefix(2) == "ru"{
        case true:
            switch answerField.text?.uppercased() == QuestionsRU.questionsAndAnswersRuList[questionValue] {
            case true:
                dvc.message = "Ура! Верный ответ!"
                switch (Score.gameRightAnswers == nil)&&(Score.sessionRightAnswers == nil){
                case true:
                    Score.gameRightAnswers = 0
                    Score.sessionRightAnswers = 0
                    Score.gameRightAnswers! += 1
                    Score.sessionRightAnswers! += 1
                case false:
                    Score.gameRightAnswers! += 1
                    Score.sessionRightAnswers! += 1
                }
            case false:
                dvc.message = "Упс... Ответ неверный..."
                switch (Score.gameWrongAnswers == nil)&&(Score.sessionlWrongAnswers == nil){
                case true:
                    Score.gameWrongAnswers = 0
                    Score.sessionlWrongAnswers = 0
                    Score.gameWrongAnswers! += 1
                    Score.sessionlWrongAnswers! += 1
                case false:
                    Score.gameWrongAnswers! += 1
                    Score.sessionlWrongAnswers! += 1
                }
            }
            answerField.text = nil
        case false:
            switch answerField.text?.uppercased() == QuestionsEN.questionsAndAnswersEnList[questionValue] {
            case true:
                dvc.message = "Good! You're right!"
                switch (Score.gameRightAnswers == nil)&&(Score.sessionRightAnswers == nil){
                case true:
                    Score.gameRightAnswers = 0
                    Score.sessionRightAnswers = 0
                    Score.gameRightAnswers! += 1
                    Score.sessionRightAnswers! += 1
                case false:
                    Score.gameRightAnswers! += 1
                    Score.sessionRightAnswers! += 1
                }
            case false:
                dvc.message = "Oops... Your answer is wrong..."
                switch (Score.gameWrongAnswers == nil)&&(Score.sessionlWrongAnswers == nil){
                case true:
                    Score.gameWrongAnswers = 0
                    Score.sessionlWrongAnswers = 0
                    Score.gameWrongAnswers! += 1
                    Score.sessionlWrongAnswers! += 1
                case false:
                    Score.gameWrongAnswers! += 1
                    Score.sessionlWrongAnswers! += 1
                }
                
            }
            answerField.text = nil
            
            
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    
}

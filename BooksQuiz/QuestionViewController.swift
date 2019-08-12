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
        answerButton.isHidden = true
        questionsAndAnswersUI()
        localizationChoiceQuestion()
        self.answerField.delegate = self
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        answerField.text = ""
        answerButton.isHidden = true
        return false
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerField: UITextField!
    
    @IBOutlet weak var answerButton: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    
    
    @IBAction func answerButton(_ sender: UIButton) {
        guard answerField.text?.isEmpty == false else {
            answerButton.isHidden = true
            return
        }
    }
    
    @IBAction func unwindToQuestionPage(segue: UIStoryboardSegue){
        if sendetQuestionsList.count > 0 {
            questionsAndAnswersUI()
            answerButton.isHidden = true
        } else {
            switch Locale.preferredLanguages[0].prefix(2) == "ru"{
            case true:
                questionLabel.text = "ВЫ ОТВЕТИЛИ НА ВСЕ ВОПРОСЫ"
            case false:
                questionLabel.text = "YOU ANSWERED ALL THE QUESTIONS"
            }
            answerButton.isHidden = true
            answerField.isHidden = true
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        if answerField.text?.isEmpty == false {
            answerButton.isHidden = false
        } else {
            answerButton.isHidden = true
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if answerField.text?.isEmpty == true {
            answerButton.isHidden = true
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
            for questions in questionsAndAnswersRuList.keys {
                sendetQuestionsList.append(questions)
            }
        case false:
            for questions in questionsAndAnswersEnList.keys {
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
            homeButton.setTitle("〈 ДОМОЙ", for: .normal)
            answerButton.setTitle("ОТВЕТ", for: .normal)
            answerField.placeholder = "Пишите Ваш ответ здесь"
        case false:
            homeButton.setTitle("〈 HOME", for: .normal)
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
            switch answerField.text?.uppercased() == questionsAndAnswersRuList[questionValue] {
            case true:
                dvc.message = "Ура! Верный ответ!"
                switch (Score.sessionRightAnswers == nil)&&(Score.totalRightAnswers == nil){
                case true:
                    Score.sessionRightAnswers = 0
                    Score.totalRightAnswers = 0
                    Score.sessionRightAnswers! += 1
                    Score.totalRightAnswers! += 1
                case false:
                    Score.sessionRightAnswers! += 1
                    Score.totalRightAnswers! += 1
                }
            case false:
                dvc.message = "Упс... Ответ неверный..."
                switch (Score.sessionWrongAnswers == nil)&&(Score.totalWrongAnswers == nil){
                case true:
                    Score.sessionWrongAnswers = 0
                    Score.totalWrongAnswers = 0
                    Score.sessionWrongAnswers! += 1
                    Score.totalWrongAnswers! += 1
                case false:
                    Score.sessionWrongAnswers! += 1
                    Score.totalWrongAnswers! += 1
                }
            }
            answerField.text = nil
        case false:
            switch answerField.text?.uppercased() == questionsAndAnswersEnList[questionValue] {
            case true:
                dvc.message = "Good! You're right!"
                switch (Score.sessionRightAnswers == nil)&&(Score.totalRightAnswers == nil){
                case true:
                    Score.sessionRightAnswers = 0
                    Score.totalRightAnswers = 0
                    Score.sessionRightAnswers! += 1
                    Score.totalRightAnswers! += 1
                case false:
                    Score.sessionRightAnswers! += 1
                    Score.totalRightAnswers! += 1
                }
            case false:
                dvc.message = "Oops... Your answer is wrong..."
                switch (Score.sessionWrongAnswers == nil)&&(Score.totalWrongAnswers == nil){
                case true:
                    Score.sessionWrongAnswers = 0
                    Score.totalWrongAnswers = 0
                    Score.sessionWrongAnswers! += 1
                    Score.totalWrongAnswers! += 1
                case false:
                    Score.sessionWrongAnswers! += 1
                    Score.totalWrongAnswers! += 1
                }
                
            }
            answerField.text = nil
            
            
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if answerField.text?.isEmpty == false {
            answerButton.isHidden = false
        } else {
            answerButton.isHidden = true
        }
        return false
    }
    
    var questionsAndAnswersRuList = ["Какой номер у нехорошей квартиры?"                            : "50",
                                     "Кто убил Сарумана?"                                           : "ГРИМА",
                                     "Что находится за платяным шкафом?"                            : "НАРНИЯ",
                                     "Под каким именем известен Том Марволо Реддл?"                 : "ВОЛДЕМОРТ"]
    
    
    
    
    var questionsAndAnswersEnList = ["What number was the bad apartment?"                            : "50",
                                     "Who killed Saruman?"                                           : "GRIMA",
                                     "What is hiding behind a wardrobe?"                             : "NARNIA",
                                     "By what name is Tom Marvolo Riddle known?"                     : "VOLDEMORT"]
    
    
}

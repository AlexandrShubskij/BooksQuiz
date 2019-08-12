//
//  ResultViewController.swift
//  BooksQuiz
//
//  Created by Александр Шубский on 02/08/2019.
//  Copyright © 2019 Александр Шубский. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var message: String?
    @IBOutlet weak var resultMessage: UILabel!
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        
    }
    
    func localizationChoiceResult() {
                
                switch Locale.preferredLanguages[0].prefix(2) == "ru"{
                case true:
                    homeButton.setTitle("〈 ДОМОЙ", for: .normal)
                    nextButton.setTitle("ДАЛЬШЕ 〉", for: .normal)
                case false:
                    homeButton.setTitle("〈 HOME", for: .normal)
                    nextButton.setTitle("NEXT 〉", for: .normal)
                }
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultMessage.text = message
        localizationChoiceResult()
        
    }
    
    
    
}

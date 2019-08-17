//
//  ViewController.swift
//  BooksQuiz
//
//  Created by Александр Шубский on 02/08/2019.
//  Copyright © 2019 Александр Шубский. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var scoreButton: UIButton!
    
    
    
    @IBAction func startButton(_ sender: UIButton) {
    }
    @IBAction func scoreButton(_ sender: UIButton) {
    }
    
    
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue){
        
    }
    func localizationChoiceStart() {
        switch Locale.preferredLanguages[0].prefix(2) == "ru"{
        case true:
            startButton.setTitle("СТАРТ", for: .normal)
            scoreButton.setTitle("СЧЁТ", for: .normal)
        case false:
            startButton.setTitle("START", for: .normal)
            scoreButton.setTitle("SCORE", for: .normal)
        }
    }
    
    func checkscore() {
        guard UserDefaults.standard.object(forKey: "TRA") != nil else {
            UserDefaults.standard.set(0, forKey: "TRA")
            return
        }
        guard UserDefaults.standard.object(forKey: "TWA") != nil else {
            UserDefaults.standard.set(0, forKey: "TWA")
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localizationChoiceStart()
        checkscore()
    }
    
    
}


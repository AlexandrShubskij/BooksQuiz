//
//  ShakingTextField.swift
//  BooksQuiz
//
//  Created by Александр Шубский on 13/08/2019.
//  Copyright © 2019 Александр Шубский. All rights reserved.
//

import UIKit

class ShakingTextField: UITextField {
    func shake () {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}

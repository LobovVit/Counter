//
//  ViewController.swift
//  Counter
//
//  Created by Vitaly on 12/07/2024.
//

import UIKit

class ViewController: UIViewController {

    var score: Int = 0
    var historyText: String = "История изменений"
    
    @IBOutlet internal weak var resetButton: UIButton!
    @IBOutlet internal weak var incrementButton: UIButton!
    @IBOutlet internal weak var decrementButton: UIButton!
    @IBOutlet internal weak var scoreLabel: UILabel!
    @IBOutlet internal weak var historyTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text = historyText
        scoreLabel.text = String(score)
        buttonChange(btn: incrementButton,btnColor: UIColor.systemRed, borderColor: UIColor.gray.cgColor)
        buttonChange(btn: decrementButton,btnColor: UIColor.systemBlue , borderColor: UIColor.gray.cgColor)
        buttonChange(btn: resetButton,btnColor: UIColor.systemGreen , borderColor: UIColor.gray.cgColor)
    }

    internal func buttonChange(btn: UIButton, btnColor: UIColor,  borderColor: CGColor) {
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 3
        btn.layer.borderColor = borderColor
        btn.backgroundColor = btnColor
        
    }
    
    @IBAction internal func decrementTouch(_ sender: Any) {
        buttonChange(btn: decrementButton,btnColor: UIColor.systemBlue , borderColor: UIColor.gray.cgColor)
        if score > 0 {
            score -= 1
            logger(message: "значение изменено на \(score) (-1)")
            show()
        } else {
            logger(message: "попытка уменьшить значение счётчика ниже 0")
            show()
        }
    }
    
    @IBAction internal func incrementTouch(_ sender: Any) {
        buttonChange(btn: incrementButton,btnColor: UIColor.systemRed, borderColor: UIColor.gray.cgColor)
        score += 1
        logger(message: "значение изменено на \(score) (+1)")
        show()
    }
    
    @IBAction internal func resetTouch(_ sender: Any) {
        buttonChange(btn: resetButton,btnColor: UIColor.systemGreen , borderColor: UIColor.gray.cgColor)
        score = 0
        logger(message: "значение сброшено")
        show()
    }
    
    internal func show() {
        scoreLabel.text = String(score)
        historyTextView.text = historyText
    }
    
    internal func logger(message: String) {
        let date: Date = Date.now
        let DateFormatter = DateFormatter()
        DateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        historyText = "\(DateFormatter.string(from: date)): \(message)" + "\n" + historyText
    }
    
    @IBAction internal func decrementTouchDown(_ sender: Any) {
        buttonChange(btn: decrementButton,btnColor: UIColor.gray, borderColor: UIColor.systemBlue.cgColor)
    }
    @IBAction internal func IncrementTouchDown(_ sender: Any) {
        buttonChange(btn: incrementButton,btnColor: UIColor.gray, borderColor: UIColor.systemRed.cgColor)
    }
    @IBAction internal func resetTouchDown(_ sender: Any) {
        buttonChange(btn: resetButton,btnColor: UIColor.gray, borderColor: UIColor.systemGreen.cgColor)
    }
}


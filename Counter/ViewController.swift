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
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyTextView.text = historyText
        scoreLabel.text = String(score)
        buttonChange(btn: incrementButton,btnColor: UIColor.systemGreen, borderColor: UIColor.gray.cgColor)
        buttonChange(btn: decrementButton,btnColor: UIColor.systemRed, borderColor: UIColor.gray.cgColor)
        buttonChange(btn: resetButton,btnColor: UIColor.systemBlue, borderColor: UIColor.gray.cgColor)
    }

    private func buttonChange(btn: UIButton, btnColor: UIColor,  borderColor: CGColor) {
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 3
        btn.layer.borderColor = borderColor
        btn.backgroundColor = btnColor
        
    }
    
    @IBAction func decrementTouch(_ sender: Any) {
        buttonChange(btn: decrementButton,btnColor: UIColor.systemRed, borderColor: UIColor.gray.cgColor)
        if score > 0 {
            score -= 1
            logger(message: "значение изменено на \(score) (-1)")
            show()
        } else {
            logger(message: "попытка уменьшить значение счётчика ниже 0")
            show()
        }
    }
    
    @IBAction func incrementTouch(_ sender: Any) {
        buttonChange(btn: incrementButton,btnColor: UIColor.systemGreen, borderColor: UIColor.gray.cgColor)
        score += 1
        logger(message: "значение изменено на \(score) (+1)")
        show()
    }
    
    @IBAction func resetTouch(_ sender: Any) {
        buttonChange(btn: resetButton,btnColor: UIColor.systemBlue, borderColor: UIColor.gray.cgColor)
        score = 0
        logger(message: "значение сброшено")
        show()
    }
    
    private func show() {
        scoreLabel.text = String(score)
        historyTextView.text = historyText
    }
    
    private func logger(message: String) {
        let date: Date = Date.now
        let DateFormatter = DateFormatter()
        DateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        historyText = "\(DateFormatter.string(from: date)): \(message)" + "\n" + historyText
    }
    
    @IBAction func decrementTouchDown(_ sender: Any) {
        buttonChange(btn: decrementButton,btnColor: UIColor.gray, borderColor: UIColor.systemRed.cgColor)
    }
    @IBAction func IncrementTouchDown(_ sender: Any) {
        buttonChange(btn: incrementButton,btnColor: UIColor.gray, borderColor: UIColor.systemGreen.cgColor)
    }
    @IBAction func resetTouchDown(_ sender: Any) {
        buttonChange(btn: resetButton,btnColor: UIColor.gray, borderColor: UIColor.systemBlue.cgColor)
    }
}


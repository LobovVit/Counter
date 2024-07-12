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
        incrementButton.backgroundColor = .systemGreen
        decrementButton.backgroundColor = .systemRed
        resetButton.backgroundColor = .systemBlue
        historyTextView.text = historyText
        scoreLabel.text = String(score)
    }

    @IBAction func decrementTouch(_ sender: Any) {
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
        score += 1
        logger(message: "значение изменено на \(score) (+1)")
        show()
    }
    
    @IBAction func resetTouch(_ sender: Any) {
        score = 0
        logger(message: "значение сброшено")
        show()
    }
    
    func show() {
        scoreLabel.text = String(score)
        historyTextView.text = historyText
    }
    
    func logger(message: String) {
        let date: Date = Date.now
        let DateFormatter = DateFormatter()
        DateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        historyText = historyText + "\n" +
        "\(DateFormatter.string(from: date)): \(message)"
    }
    
}


//
//  ViewController.swift
//  Counter
//
//  Created by Vitaly on 12/07/2024.
//

import UIKit

class ViewControllerMain: UIViewController {

    private var score: Int = 0
    private var historyText: String = ""
    
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        historyText = getHistory()
        historyTextView.text = historyText
        scoreLabel.text = String(score)
        buttonChange(btn: incrementButton,btnColor: UIColor.systemRed, borderColor: UIColor.gray.cgColor)
        buttonChange(btn: decrementButton,btnColor: UIColor.systemBlue , borderColor: UIColor.gray.cgColor)
        buttonChange(btn: resetButton,btnColor: UIColor.systemGreen , borderColor: UIColor.gray.cgColor)
        welcomeLabel.text = getWelcome()
    }
    
    private func getWelcome() -> String {
        guard let userName = UserDefaults.standard.string(forKey: "login") else {return "good luck"}
        return "good luck \(userName)"
    }
    
    private func getHistory() -> String {
        guard let history = UserDefaults.standard.string(forKey: "history") else {return "История изменений"}
        return "История изменений \n" + "\(history)"
    }

    private func buttonChange(btn: UIButton, btnColor: UIColor,  borderColor: CGColor) {
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 3
        btn.layer.borderColor = borderColor
        btn.backgroundColor = btnColor
        
    }
    
    @IBAction private func decrementTouch(_ sender: Any) {
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
    
    @IBAction private func incrementTouch(_ sender: Any) {
        buttonChange(btn: incrementButton,btnColor: UIColor.systemRed, borderColor: UIColor.gray.cgColor)
        score += 1
        logger(message: "значение изменено на \(score) (+1)")
        show()
    }
    
    @IBAction private func resetTouch(_ sender: Any) {
        buttonChange(btn: resetButton,btnColor: UIColor.systemGreen , borderColor: UIColor.gray.cgColor)
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
        UserDefaults.standard.set(historyText, forKey: "history")
    }
    
    @IBAction private func decrementTouchDown(_ sender: Any) {
        buttonChange(btn: decrementButton,btnColor: UIColor.gray, borderColor: UIColor.systemBlue.cgColor)
    }
    @IBAction private func IncrementTouchDown(_ sender: Any) {
        buttonChange(btn: incrementButton,btnColor: UIColor.gray, borderColor: UIColor.systemRed.cgColor)
    }
    @IBAction private func resetTouchDown(_ sender: Any) {
        buttonChange(btn: resetButton,btnColor: UIColor.gray, borderColor: UIColor.systemGreen.cgColor)
    }
}


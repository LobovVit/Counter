//
//  ViewControllerLogin.swift
//  Counter
//
//  Created by Vitaly on 14/08/2024.
//

import UIKit
import Security

class ViewControllerLogin: UIViewController {
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var rememberSwitch: UISwitch!
    @IBOutlet private weak var welcomeLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.text = UserDefaults.standard.string(forKey: "login")
        passwordTextField.text = UserDefaults.standard.string(forKey: "password")
        welcomeLable.text = getWelcome()
    }
    
    @IBAction private func loginBuutonTUp(_ sender: Any) {
        if rememberSwitch.isOn {
            UserDefaults.standard.set(loginTextField.text, forKey: "login")
            UserDefaults.standard.set(passwordTextField.text, forKey: "password")
        } else {
            UserDefaults.standard.removeObject(forKey: "login")
            UserDefaults.standard.removeObject(forKey: "password")
        }
    }
    @IBAction private func loginDidEnd(_ sender: Any) {
        welcomeLable.text = getWelcome()
    }
    
    private func getWelcome() -> String {
        guard let userName = loginTextField.text else {return "Welcome"}
        return "Welcome \(userName)"
    }
}

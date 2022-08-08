//
//  ViewController.swift
//  LogOut
//
//  Created by Yaroslav on 21.11.2021.
//

import UIKit


// MARK: - ViewController
class LogInViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak private var loginTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var logInButton: UIButton!
    @IBOutlet weak private var userNameButton: UIButton!
    @IBOutlet weak private var passwordButton: UIButton!
    
    // MARK: - Properties
    private let user = User.getUserDate()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGreeting" {
            let tabBar = segue.destination as! UITabBarController
            setupGreetingVC(tabBar: tabBar)
            setupUserVC(tabBar: tabBar)
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        loginTextField.text = nil
        passwordTextField.text = nil
    }
}

// MARK: - Action
private extension LogInViewController {
    @IBAction func tapToLogInButton() {
        guard let inputLoginText = loginTextField.text,
              let inputPasswordText = passwordTextField.text,
              !inputLoginText.isEmpty,
              !inputPasswordText.isEmpty else {
                  showLogInAlert(with: "Invalide login or password", and: "Please, enter correct login and password")
                  return
              }
        
        guard inputLoginText == user.name && inputPasswordText == user.password else {
            showLogInAlert(with: "Invalide login or password", and: "Please, enter correct login and password")
            return
        }
        
        performSegue(withIdentifier: "showGreeting", sender: nil)
    }
    
    @IBAction func tapToForgotButton(_ sender: UIButton) {
        switch sender.tag {
        case 0: showLogInAlert(with: "Oops!", and: "Your name is User 😘")
        case 1: showLogInAlert(with: "Oops!", and: "Your password is Password 🤪")
        default: break
        }
    }
}

// MARK: - Private Extension
private extension LogInViewController {
    func setupUI() {
        setupLoginTextField()
        setupPasswordTextField()
    }
    
    func setupLoginTextField() {
        loginTextField.delegate = self
        loginTextField.tag = 0
        loginTextField.returnKeyType = .next
    }
    
    func setupPasswordTextField() {
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        passwordTextField.returnKeyType = .done
    }
    
    func setupGreetingVC(tabBar: UITabBarController) {
        let greetingVC = tabBar.viewControllers?.first as! GreetingVC
        greetingVC.name = "Welcome, \(user.name)"
        
    }
    
    func setupUserVC(tabBar: UITabBarController) {
        let navigationVC = tabBar.viewControllers?.last as! UINavigationController
        let aboutUser = navigationVC.topViewController as! UserVC
        aboutUser.userName = user.name
    }
}

// MARK: - UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
    //Cкрытие клавиатуры
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            tapToLogInButton()
        }
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

//MARK: - UIAlertController
extension LogInViewController {
    private func showLogInAlert (with title: String, and message: String) {
        let logInAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default) { _ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        logInAlert.addAction(okAlert)
        present(logInAlert, animated: true, completion: nil)
    }
}

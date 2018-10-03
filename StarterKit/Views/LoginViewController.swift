//
//  LoginViewController.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 25/09/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import UIKit
import ReSwift

class LoginViewController: UIViewController, StoreSubscriber, UITextFieldDelegate {

    @IBOutlet weak var textEmail: TextField!
    @IBOutlet weak var textPassword: TextField!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var btnLogin: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewContainer.bindToKeyboard()
        textEmail.delegate = self
        textPassword.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewContainer.endEditing(true)
        store.unsubscribe(self)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            alert.dismiss(animated: true)
        })
        
        self.present(alert, animated: true)
    }
    
    func newState(state: AppState) {
        btnLogin.loading = state.auth.busy
        
        if (state.auth.currentUser != nil) {
            self.dismiss(animated: false)
        }
        
        if (state.auth.error != nil) {
            showAlert(title: "Login error", message: state.auth.error!)
        }
    }
    
    func validData() -> Bool {
        guard let email = textEmail.text, !email.isEmpty else {
            store.dispatch(AuthActions.error("Email address cannot be empty"))
            return false
        }
        
        guard let password = textPassword.text, !password.isEmpty else {
            store.dispatch(AuthActions.error("Password cannot be empty"))
            return false
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textPassword || textField == textEmail {
            textField.resignFirstResponder()
            onLogin(textField)
            return false
        }
        return true
    }
    

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true)
    }

    @IBAction func onLogin(_ sender: Any) {
        if validData() {
            let action = AuthEffects.login(email: textEmail.text!, password: textPassword.text!)
            store.dispatch(action)
        }
    }
}

//
//  SignupViewController.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 25/09/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import UIKit
import ReSwift

class SignupViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var textName: TextField!
    @IBOutlet weak var textEmail: TextField!
    @IBOutlet weak var textPassword: TextField!
    @IBOutlet weak var btnCreate: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainer.bindToKeyboard()
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewContainer.endEditing(true)
        store.unsubscribe(self)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            alert.dismiss(animated: true)
        })
        
        self.present(alert, animated: true)
    }
    
    func validData() -> Bool {
        guard let name = textName.text, !name.isEmpty else {
            store.dispatch(AuthActions.error("Name cannot be empty"))
            return false
        }

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
    
    func newState(state: AppState) {
        btnCreate.loading = state.auth.busy
        
        if (state.auth.currentUser != nil) {
            self.dismiss(animated: false)
        }
        
        if (state.auth.error != nil) {
            showAlert(title: "Signup error", message: state.auth.error!)
        }
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreate(_ sender: Any) {
        if validData() {
            let action = AuthEffects.signup(name: textName.text!, email: textEmail.text!, password: textPassword.text!)
            store.dispatch(action)
        }
    }
}

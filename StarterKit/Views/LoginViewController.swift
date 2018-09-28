//
//  LoginViewController.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 25/09/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textLogin: TextField!
    @IBOutlet weak var textPassword: TextField!
    @IBOutlet weak var viewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewContainer.bindToKeyboard()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewContainer.endEditing(true)
    }

    @IBAction func onLogin(_ sender: Any) {
    }
}

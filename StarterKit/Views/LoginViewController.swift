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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textLogin.becomeFirstResponder()
    }

}

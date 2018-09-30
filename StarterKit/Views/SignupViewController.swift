//
//  SignupViewController.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 25/09/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var textName: TextField!
    @IBOutlet weak var textEmail: TextField!
    @IBOutlet weak var textPassword: TextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainer.bindToKeyboard()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewContainer.endEditing(true)
    }

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onCreate(_ sender: Any) {
        // store.reducers.signup()
    }
}

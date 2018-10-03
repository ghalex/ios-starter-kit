//
//  ViewController.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 25/09/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import UIKit
import ReSwift

class MainViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var labelMain: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        store.subscribe(self)
    }
    
    func newState(state: AppState) {
        labelMain.text = "Welcome: \(state.auth.currentUser?.displayName ?? "User")"
    }

    @IBAction func onLogout(_ sender: Any) {
        store.dispatch(AuthEffects.logout())
        dismiss(animated: false)
    }
    
}


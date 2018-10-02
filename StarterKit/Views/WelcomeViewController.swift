//
//  WelcomeViewController.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 25/09/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import UIKit
import ReSwift

class WelcomeViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnLogin.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        appStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        appStore.unsubscribe(self)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func newState(state: AppState) {
        let counterState = state.counter
        btnLogin.titleLabel?.text = String(counterState.count)
    }

    @IBAction func onFacebook(_ sender: Any) {
        appStore.dispatch(CounterAction.increase(value: 2))
    }
}

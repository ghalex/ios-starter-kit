//
//  ResetViewController.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 28/09/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {

    @IBOutlet weak var textReset: TextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onReset(_ sender: Any) {
    }
}

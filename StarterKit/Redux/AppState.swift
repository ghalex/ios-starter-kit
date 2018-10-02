//
//  AppState.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 02/10/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import Foundation
import ReSwift

struct AppState: StateType {
    var version = "1.0.0"
    var counter = CounterState()
}

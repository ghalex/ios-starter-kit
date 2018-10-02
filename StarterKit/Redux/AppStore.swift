//
//  Store.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 02/10/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import Foundation
import ReSwift

let appStore = Store(
    reducer: appReducer,
    state: AppState(),
    middleware: []
)

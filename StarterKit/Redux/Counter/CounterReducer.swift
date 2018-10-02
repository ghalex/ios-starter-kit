//
//  RootReducer.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 02/10/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import Foundation
import ReSwift

func counterReducer(action: CounterAction, state: CounterState?) -> CounterState {
    var state = state ?? CounterState()
    
    switch action {
        case let .increase(value):
            state.count += value
        default:
            print("default")
    }
    
    return state
}

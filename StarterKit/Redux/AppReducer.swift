//
//  RootReducer.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 02/10/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import Foundation
import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    
    switch action {
    case _ as CounterAction:
        state.counter = counterReducer(action: action as! CounterAction, state: state.counter)
    default:
        print("default")
    }
    
    return state
}

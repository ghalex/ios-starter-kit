//
//  RootReducer.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 02/10/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import Foundation
import ReSwift

func authReducer(action: AuthActions, state: AuthState?) -> AuthState {
    var state = state ?? AuthState()
    
    switch action {
        case .changeUser(let user):
            state.currentUser = user
        case .busy(let value):
            state.busy = value
            state.error = nil
        case .error(let msg):
            state.error = msg
            state.busy = false
    }
    
    return state
}

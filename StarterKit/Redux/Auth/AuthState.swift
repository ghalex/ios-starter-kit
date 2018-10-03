//
//  AppState.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 02/10/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import Foundation
import ReSwift
import FirebaseAuth

struct AuthState {
    var busy: Bool = false
    var currentUser: User? = Auth.auth().currentUser
    var error: String? = nil
    
}

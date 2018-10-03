//
//  UsersStore.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 02/10/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import Foundation
import ReSwift
import FirebaseAuth

enum AuthActions: Action {
    case changeUser(_ user: User?)
    case busy(_ value: Bool)
    case error(_ msg: String?)
}

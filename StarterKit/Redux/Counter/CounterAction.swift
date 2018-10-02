//
//  CountAction.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 02/10/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import Foundation
import ReSwift

enum CounterAction: Action {
    case increase(value: Int)
    case decrease(value: Int)
}

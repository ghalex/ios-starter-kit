//
//  Effects.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 03/10/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import Foundation
import ReSwift

public typealias EffectType = (@escaping DispatchFunction) -> Void
public struct EffectAction: Action {
    var effect: EffectType
}

let effectsMiddleware: Middleware<Any> = { dispatch, getState in
    return { next in
        return { action in
            let effectAction = action as? EffectAction
            if effectAction != nil {
                effectAction?.effect(dispatch)
            } else {
                next(action)
            }
        }
    }
}

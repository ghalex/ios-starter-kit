//
//  UsersEffects.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 02/10/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import Foundation
import FirebaseAuth
import ReSwift

class AuthEffects {
    static func login(email: String, password: String) -> EffectAction  {
        return EffectAction(effect: { dispatch in
            dispatch(AuthActions.busy(true))

            Auth.auth().signIn(
                withEmail: email,
                password: password,
                completion: { authData, error in
                    dispatch(AuthActions.busy(false))
                    guard error == nil, authData != nil, authData?.user != nil else {
                        dispatch(AuthActions.error(error?.localizedDescription))
                        return
                    }

                    dispatch(AuthActions.changeUser((authData?.user)!))
            })
        })
    }
    
    static func signup(name: String, email: String, password: String) -> EffectAction {
        return EffectAction(effect: { dispatch in
            dispatch(AuthActions.busy(true))
            
            Auth.auth().createUser(
                withEmail: email,
                password: password,
                completion: { authData, error in
                    guard error == nil, authData != nil, authData?.user != nil else {
                        dispatch(AuthActions.error(error?.localizedDescription))
                        return
                    }
                    
                    let profileChangeReq = Auth.auth().currentUser?.createProfileChangeRequest()
                    profileChangeReq?.displayName = name
                    profileChangeReq?.commitChanges() { error in
                        guard error == nil else {
                            dispatch(AuthActions.error(error?.localizedDescription))
                            return
                        }
                        
                        dispatch(AuthActions.busy(false))
                        dispatch(AuthActions.changeUser((authData?.user)!))
                    }
            })
        })
    }
    
    static func logout() -> EffectAction {
        return EffectAction(effect: { dispatch in
            try! Auth.auth().signOut()
            dispatch(AuthActions.changeUser(nil))
        })
    }
}

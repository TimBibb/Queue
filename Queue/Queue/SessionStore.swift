//
//  SessionStore.swift
//  Queue
//
//  Created by Tim Bibbee on 10/10/20.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase
import Combine

class SessionStore : ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    var session: User? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?

    func listen () {
        // monitor authentication changes using firebase
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // if we have a user, create a new user model
                print("Got user: \(user)")
                self.session = User(
                    uid: user.uid,
                    displayName: user.displayName,
                    email: user.email
                )
            } else {
                // if we don't have a user, set our session to nil
                self.session = nil
            }
        }
    }

    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
            Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
    
    func unbind () {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}

struct Queue {
    
    let ref: DatabaseReference?
    let key: String
    let merchantID: String
    let merchantName: String
    let userID: String
    
    init(todo: String, merchantID: String, merchantName: String, userID: String, key: String = "") {
        self.ref = nil
        self.key = key
        self.merchantID = merchantID
        self.merchantName = merchantName
        self.userID = userID
    }
    
    func toAnyObject() -> Any {
        return [
            "merchantID": merchantID,
            "merchantName": merchantName,
            "userID": userID
        ]
    }
}

    

class User {
    var uid: String
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}

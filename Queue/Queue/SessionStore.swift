//
//  SessionStore.swift
//  Queue
//
//  Created by Tim Bibbee on 10/10/20.
//

import SwiftUI
import Firebase
import Combine

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

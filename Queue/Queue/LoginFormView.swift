//
//  LoginFormView.swift
//  Queue
//
//  Created by Tim Bibbee on 10/11/20.
//

import SwiftUI

struct LoginFormView : View {

    @State private var userName: String = ""
    @State private var password: String = ""

    @State private var showError = false

    @Binding var signInSuccess: Bool
    @Binding var username: String

    var body: some View {
        VStack {
            HStack {
                Text("User name")
                TextField("Username", text: $userName)
            }.padding()
            
            Button(action: {
                // Your auth logic
                if(self.userName != "") {
                    self.signInSuccess = true
                    self.username = self.userName
                }
                else {
                    self.showError = true
                }
            }) {
                Text("Sign in")
            }

            if showError {
                Text("Incorrect username/password").foregroundColor(Color.red)
            }
        }
    }
}

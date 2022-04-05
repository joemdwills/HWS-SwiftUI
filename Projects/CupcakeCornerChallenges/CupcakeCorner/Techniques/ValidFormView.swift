//
//  ValidFormView.swift
//  CupcakeCorner
//
//  Created by Joe on 03/04/2022.
//

import SwiftUI

struct ValidFormView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account")
                }
            }
            .disabled(disableForm)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

struct ValidFormView_Previews: PreviewProvider {
    static var previews: some View {
        ValidFormView()
    }
}

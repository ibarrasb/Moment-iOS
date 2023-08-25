//
//  LoginViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/25/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            Text("Moment")
                .font(.custom("BodoniSvtyTwoSCITCTT-Book", size: 60))
                .foregroundColor(.white)
                .padding(.bottom, 20)
    
            TextField("Username", text: $username)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(5)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(5)
                .padding(.bottom, 20)
            
            Button(action: {
                // Handle login action
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            
            HStack {
                Spacer()
                Button(action: {
                    // Handle forgot password action
                }) {
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                }
            }
            .padding(.top, 10)
            
            Spacer()
            
            HStack {
                Text("Don't have an account?")
                Button(action: {
                    // Handle sign up action
                }) {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .background(Color(UIColor.darkGray)) // Set the background color here
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//  SignUpViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/25/23.
//

import SwiftUI

struct SignUpViewController: View {
    @State private var fullname = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                Text("Moment")
                    .font(.custom("BodoniSvtyTwoSCITCTT-Book", size: 60))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                Text("Sign Up")
                    .font(.custom("BodoniSvtyTwoSCITCTT-Book", size: 25))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
            }
        
            TextField("Full Name", text: $fullname)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(5)
                .padding(.bottom, 20)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(5)
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
            
            TextField("Confirm password", text: $confirmPassword)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(5)
                .padding(.bottom, 20)
            
            Button(action: {
                // Handle login action
            }) {
                Text("Sign up")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            
          
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
                Button(action: {
                    // Handle sign up action
                }) {
                    Text("Sign In")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.9)) // Set the background color here
    }
}

struct SignUpViewController_Previews: PreviewProvider {
    static var previews: some View {
        SignUpViewController()
    }
}

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
    @State private var isLoggedIn = false // Added a state variable for tracking login status
    @State private var isSignUpViewPresented = false

    var body: some View {
        NavigationView {
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
                    // Simulating a successful login here, you should replace this with your actual login logic
                    if username == "Ebarra" && password == "1234" {
                        isLoggedIn = true // Set the state variable to true for a successful login
                    }
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
                                   // Use NavigationLink to navigate to the sign-up view
                                   NavigationLink("", destination: SignUpViewController().navigationBarBackButtonHidden(true), isActive: $isSignUpViewPresented)
                                   Button(action: {
                                       // Set isSignUpViewPresented to true to present the sign-up view
                                       isSignUpViewPresented = true
                                   }) {
                                       Text("Sign Up")
                                           .foregroundColor(.blue)
                                   }
                               }
                           }
                           .padding()
                           .background(Color(UIColor.darkGray)) // Set the background color here
                           .fullScreenCover(isPresented: $isLoggedIn) {
                               MainTabViewController() // Navigate to MainTabViewController when isLoggedIn is true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

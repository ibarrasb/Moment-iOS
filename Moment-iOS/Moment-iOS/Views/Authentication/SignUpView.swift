//
//  SignUpView.swift
//  Moment-iOS
//
//  Updated by eduardo on 8/6/25
//

import SwiftUI

struct SignUpView: View {
    @State private var fullname = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray.opacity(0.85)]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 8) {
                        Text("Moment")
                            .font(.custom("BodoniSvtyTwoSCITCTT-Book", size: 48))
                            .foregroundColor(.white)
                        Text("Create Your Account")
                            .font(.title3.weight(.medium))
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding(.top, 60)

                    // Full Name
                    TextField("Full Name", text: $fullname)
                        .keyboardType(.default)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(12)

                    // Email
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(12)

                    // Username
                    TextField("Username", text: $username)
                        .keyboardType(.default)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(12)

                    // Password
                    SecureField("Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(12)

                    // Confirm Password
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(12)

                    // Sign Up Button
                    Button(action: {
                        // TODO: handle signup
                    }) {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }

                    // Already have an account
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .foregroundColor(.white.opacity(0.7))
                        Button("Sign In") {
                            // TODO: handle sign-in navigation
                        }
                        .foregroundColor(.blue)
                        .fontWeight(.medium)
                    }

                    Spacer()
                }
                .padding()
            }
            .scrollDismissesKeyboard(.interactively)
        }
    }
}

#Preview {
    SignUpView()
}


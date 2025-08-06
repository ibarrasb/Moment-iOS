//
//  LoginView.swift
//  Moment-iOS
//
//  Updated by eduardo on 8/6/25
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var showSignUp = false
    @FocusState private var focusedField: Field?

    enum Field {
        case username
        case password
    }

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.black, Color.gray.opacity(0.85)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 24) {
                    Spacer(minLength: 60)

                    Text("Moment")
                        .font(.custom("BodoniSvtyTwoSCITCTT-Book", size: 60))
                        .foregroundColor(.white)

                    // Username Field
                    TextField("Username", text: $username)
                        .keyboardType(.default)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .focused($focusedField, equals: .username)
                        .submitLabel(.next)
                        .onSubmit { focusedField = .password }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(12)

                    // Password Field
                    SecureField("Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .focused($focusedField, equals: .password)
                        .submitLabel(.go)
                        .onSubmit { handleLogin() }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(12)

                    // Login Button
                    Button(action: handleLogin) {
                        Text("Login")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }

                    // Forgot Password
                    HStack {
                        Spacer()
                        Button("Forgot Password?") {
                            // TODO: Password reset action
                        }
                        .foregroundColor(.blue)
                        .font(.callout)
                    }

                    Spacer()

                    // Sign Up Prompt
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                            .foregroundColor(.white.opacity(0.7))
                        Button("Sign Up") {
                            showSignUp = true
                        }
                        .foregroundColor(.blue)
                        .fontWeight(.medium)
                    }
                }
                .padding()
            }
            .navigationDestination(isPresented: $showSignUp) {
                SignUpView()
                    .navigationBarBackButtonHidden(true)
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                MainTabView()
            }
            .scrollDismissesKeyboard(.interactively)
        }
    }

    private func handleLogin() {
        // TEMP: Replace with real auth
        if username == "Ebarra" && password == "1234" {
            isLoggedIn = true
        }
    }
}

#Preview {
    LoginView()
}

//
//  LoginView.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 3/9/25.
//


import SwiftUI

struct LoginView: View {
    
    @State private var email            : String = ""
    @State private var password         : String = ""
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            // Title
            VStack(spacing: 4) {
                HStack {
                    Image(systemName: "brain")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        .padding()
                }
                .background(Color.blue)
                .cornerRadius(7)
                .frame(width: 100,height: 100)
              
               
                VStack(alignment: .center) {
                    Text("ExpenseAI")
                        .font(.system(size: 21, weight: .bold))
                        .foregroundColor(.black)
                        
                    Text("Smart Financial Tracking")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
               
            }
            .padding(.bottom, 40)
            
            // Email Field
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                TextField("Enter your email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            // Password Field
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                if isPasswordVisible {
                    TextField("Enter your password", text: $password)
                } else {
                    SecureField("Enter your password", text: $password)
                }
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            // Sign In Button
            Button(action: {
                // Handle sign in
            }) {
                Text("SIGN IN")
                    .font(.title2)
                    .frame(maxWidth: .infinity,maxHeight: 30)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 10)
            
            // Divider
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.3))
                Text("or")
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.3))
            }
            .padding(.vertical, 10)
            
            // Google Sign In
            Button(action: {
                // Handle Google login
            }) {
                HStack {
                    Image(systemName: "g.circle.fill")
                        .foregroundColor(.red)
                        .font(.title2)
                    Text("Continue with Google")
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .frame(maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    LoginView()
}

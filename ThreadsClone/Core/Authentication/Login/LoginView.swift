//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct LoginView: View {
  @StateObject private var viewModel = LoginViewModel()
  
  var body: some View {
    NavigationStack {
      VStack {
        Spacer()
        
        Text("@")
          .font(.system(size: 130))
          .fontWeight(.bold)
          .offset(y: -8)
          .frame(width: 120, height: 120)
        
        VStack {
          Group {
            TextField("Enter your email", text: $viewModel.email)
              .keyboardType(.emailAddress)
              .textInputAutocapitalization(.none)
              .autocorrectionDisabled()
            
            SecureField("Enter your password", text: $viewModel.password)
          }
          .modifier(ThreadsTextFieldViewModifier())
        }
        
        NavigationLink {
          Text("Forgot password")
        } label: {
          Text("Forgot password?")
            .font(.footnote)
            .fontWeight(.semibold)
            .padding(.vertical)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        
        Button(.authLoginButton) {
          Task { try await viewModel.login() }
        }
        .buttonStyle(.threadsPrimary)
        
        Spacer()
        
        Divider()
        
        NavigationLink {
          RegistrationView()
            .navigationBarBackButtonHidden()
        } label: {
          Text(.authSignUpPrompt)
            .font(.subheadline)
            .font(.footnote)
            .padding(.vertical, 16)
            .foregroundStyle(.black)
        }
      }
      .padding(.horizontal, 24)
    }
  }
}

#Preview {
  LoginView()
}

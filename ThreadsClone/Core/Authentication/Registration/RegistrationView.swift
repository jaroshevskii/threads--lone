//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct RegistrationView: View {
  @StateObject var viewModel = RegistrationViewModel()
  
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
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
            .textInputAutocapitalization(.never)
          
          SecureField("Enter your password", text: $viewModel.password)
          
          TextField("Enter your full name", text: $viewModel.fullName)
          
          TextField("Enter your username", text: $viewModel.username)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
        }
        .modifier(ThreadsTextFieldViewModifier())
      }
      
      Button(.authSignUpButton) {
        Task { try await viewModel.createUser() }
      }
      .buttonStyle(.threadsPrimary)
      
      Spacer()
      
      Divider()
      
      Button {
        dismiss()
      } label: {
        Text(.authSignInPrompt)
          .font(.subheadline)
          .font(.footnote)
          .padding(.vertical, 16)
          .foregroundStyle(.black)
      }
    }
    .padding(.horizontal)
  }
}

#Preview {
    RegistrationView()
}

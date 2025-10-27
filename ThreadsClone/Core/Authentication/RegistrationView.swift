//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct RegistrationView: View {
  @State private var email = ""
  @State private var password = ""
  @State private var fullName = ""
  @State private var username = ""
  
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
          TextField("Enter your email", text: $email)
          SecureField("Enter your password", text: $password)
          TextField("Enter your full name", text: $fullName)
          TextField("Enter your username", text: $username)
        }
        .modifier(ThreadsTextFieldViewModifier())
      }
      
      Button(.authSignUpButton) {
        
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

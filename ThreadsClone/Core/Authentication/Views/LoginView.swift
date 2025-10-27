//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct LoginView: View {
  @State private var email = ""
  @State private var password = ""
  
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
            TextField("Enter your email", text: $email)
              .textInputAutocapitalization(.none)
            
            SecureField("Enter your password", text: $password)
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
        
        }
        .buttonStyle(.threadsPrimary)
        
        Spacer()
        
        Divider()
        
        NavigationLink {
          Text("Registration View")
        } label: {
          Text(.authSignUpPrompt)
            .font(.subheadline)
            .font(.footnote)
            .padding(.vertical, 16)
            .foregroundStyle(.black)
        }
      }
    }
    .padding(.horizontal, 24)
  }
}

#Preview {
  LoginView()
}

//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  
  @MainActor
  func login() async throws {
    try await AuthService.shared.login(withEmail: email, password: password)
  }
}

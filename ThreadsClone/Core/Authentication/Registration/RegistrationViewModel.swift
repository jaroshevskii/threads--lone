//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import Foundation
import Combine

final class RegistrationViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var fullName = ""
  @Published var username = ""
  
  @MainActor
  func createUser() async throws {
   try await AuthService.shared.createUser(
      withEmail: email,
      password: password,
      fullName: fullName
    )
  }
}

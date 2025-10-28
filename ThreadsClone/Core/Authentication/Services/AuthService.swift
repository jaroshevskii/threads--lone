//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import FirebaseAuth

final class AuthService {
  static let shared = AuthService()
  
  @MainActor
  func login(withEmail email: String, password: String) async throws {
    
  }
  
  @MainActor
  func createUser(withEmail email: String, password: String, fullName: String) async throws {
    do {
      let result = try await Auth.auth().createUser(withEmail: email, password: password)
      print("DEBUG: Create user \(result.user.uid)")
    } catch {
      print("DEBUG: Failed to create user with error \(error.localizedDescription)")
    }
  }
}

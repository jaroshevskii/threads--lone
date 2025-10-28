//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import FirebaseAuth
import Combine

final class AuthService {
  @Published  var userSession: FirebaseAuth.User?
  
  static let shared = AuthService()
  
  init() {
    self.userSession = Auth.auth().currentUser
  }
  
  @MainActor
  func login(withEmail email: String, password: String) async throws {
    do {
      let result = try await Auth.auth().signIn(withEmail: email, password: password)
      userSession = result.user
      print("DEBUG: Create user \(result.user.uid)")
    } catch {
      print("DEBUG: Failed to create user with error \(error.localizedDescription)")
    }
  }
  
  @MainActor
  func createUser(withEmail email: String, password: String, fullName: String) async throws {
    do {
      let result = try await Auth.auth().createUser(withEmail: email, password: password)
      userSession = result.user
      print("DEBUG: Create user \(result.user.uid)")
    } catch {
      print("DEBUG: Failed to create user with error \(error.localizedDescription)")
    }
  }
  
  @MainActor
  func signOut() {
    try? Auth.auth().signOut()
    self.userSession = nil
  }
}

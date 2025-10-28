//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import FirebaseAuth
import FirebaseFirestore
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
    } catch {
      print("DEBUG: Failed to create user with error \(error.localizedDescription)")
    }
  }
  
  @MainActor
  func createUser(
    withEmail email: String,
    password: String,
    fullName: String,
    username: String
  ) async throws {
    do {
      let result = try await Auth.auth().createUser(withEmail: email, password: password)
      userSession = result.user
      try await uploadUserData(
        withEmail: email,
        fullName: fullName,
        username: username,
        id: result.user.uid
      )
    } catch {
      print("DEBUG: Failed to create user with error \(error.localizedDescription)")
    }
  }
  
  func signOut() {
    try? Auth.auth().signOut()
    self.userSession = nil
  }
  
  @MainActor
  private func uploadUserData(
    withEmail email: String,
    fullName: String,
    username: String,
    id: String
  ) async throws {
    let user = User(id: id, username: username, email: email, fullName: fullName)
    let userData = try Firestore.Encoder().encode(user)
    try await Firestore.firestore().collection("users").document(id).setData(userData)
  }
}

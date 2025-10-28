//
//  UserService.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import FirebaseAuth
import FirebaseFirestore
import Combine

final class UserService {
  @Published var currentUser: User?
  
  static let shared = UserService()
  
  init() {
    Task { try await fetchCurrentUser() }
  }
  
  @MainActor
  func fetchCurrentUser() async throws {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
    let user = try snapshot.data(as: User.self)
    currentUser = user
  }
  
  static func fetchUsers() async throws -> [User] {
    do {
      guard let currentUID = Auth.auth().currentUser?.uid else { return [] }
      let snapshot = try await Firestore.firestore().collection("users").getDocuments()
      let users = snapshot.documents.compactMap { try? $0.data(as: User.self) }
      return users.filter { $0.id != currentUID }
    } catch {
      throw error
    }
  }
  
  func reset() {
    self.currentUser = nil
  }
}

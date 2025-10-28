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
    
    print("DEBUG: User is \(user)")
  }
}

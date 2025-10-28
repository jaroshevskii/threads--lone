//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import Foundation
import Combine

@MainActor
final class ExploreViewModel: ObservableObject {
  @Published var users = [User]()
  
  func fetchUsers() async throws {
    guard users.isEmpty else { return }
    users = try await UserService.fetchUsers()
  }
}

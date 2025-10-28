//
//  User.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
  let id: String
  let username: String
  let email: String
  let fullName: String
  var profileImageURL: URL?
  var bio: String?
}

extension User {
  static let mock = User(
    id: "user_001",
    username: "sasha",
    email: "sasha@example.com",
    fullName: "Sasha Jaroshevskii",
    profileImageURL: URL(string: "https://example.com/avatar/sasha.png"),
    bio: "Building a Threads clone in SwiftUI"
  )

  static let mock2 = User(
    id: "user_002",
    username: "alex",
    email: "alex@example.com",
    fullName: "Alex Doe",
    profileImageURL: URL(string: "https://example.com/avatar/alex.png"),
    bio: "iOS • Swift • Coffee"
  )

  static let mocks: [User] = [
    .mock,
    .mock2,
    User(
      id: "user_003",
      username: "jamie",
      email: "jamie@example.com",
      fullName: "Jamie Lee",
      profileImageURL: URL(string: "https://example.com/avatar/jamie.png"),
      bio: "Designer turned developer"
    )
  ]
}

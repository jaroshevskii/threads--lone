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
  var profileImageURL: String?
  var bio: String?
}

extension User {
  static let mock = Self(
    id: "user_001",
    username: "sasha",
    email: "sasha@example.com",
    fullName: "Sasha Jaroshevskii",
    profileImageURL: "https://file-examples.com/storage/fe641bfb6369024e2970955/2017/10/file_example_JPG_100kB.jpg",
    bio: "Building a Threads clone in SwiftUI"
  )

  static let mock2 = Self(
    id: "user_002",
    username: "alex",
    email: "alex@example.com",
    fullName: "Alex Doe",
    profileImageURL: "https://file-examples.com/storage/fe641bfb6369024e2970955/2017/10/file_example_JPG_100kB.jpg",
    bio: "iOS • Swift • Coffee"
  )
  
  static let mockMinimal = Self(
    id: "user_001",
    username: "sasha",
    email: "sasha@example.com",
    fullName: "Sasha Jaroshevskii"
  )

  static let mocks: [Self] = [
    .mock,
    .mock2,
    Self(
      id: "user_003",
      username: "jamie",
      email: "jamie@example.com",
      fullName: "Jamie Lee",
      profileImageURL: "https://file-examples.com/storage/fe641bfb6369024e2970955/2017/10/file_example_JPG_100kB.jpg",
      bio: "Designer turned developer"
    )
  ]
}

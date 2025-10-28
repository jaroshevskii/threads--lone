//
//  User.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import Foundation

struct User: Identifiable, Codable {
  let id: String
  let username: String
  let email: String
  let fullName: String
  var profileImageURL: URL?
  var bio: String?
}

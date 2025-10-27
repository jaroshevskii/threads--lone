//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
  case threads, replies
  
  var id: Int { rawValue }
  
  var title: String {
    switch self {
    case .threads: "Threads"
    case .replies: "Replies"
    }
  }
}

//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import Foundation
import FirebaseAuth
import Combine

final class ContentViewModel: ObservableObject {
  @Published var userSession: FirebaseAuth.User?
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    setupSubscribers()
  }
  
  private func setupSubscribers() {
    AuthService.shared.$userSession.sink { [weak self] user in
      self?.userSession = user
    }
    .store(in: &cancellables)
  }
}

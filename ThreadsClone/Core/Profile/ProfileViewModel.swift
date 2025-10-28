//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
  @Published var currentUser: User?
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    setupSubscribers()
  }
  
  private func setupSubscribers() {
    UserService.shared.$currentUser.sink { [weak self] user in
      self?.currentUser = user
      print("DEBUG: User in view model is \(String(describing: user))")
    }
    .store(in: &cancellables)
  }
}

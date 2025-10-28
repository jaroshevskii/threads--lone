//
//  CurrentUserProfileViewModel.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

final class CurrentUserProfileViewModel: ObservableObject {
  @Published var currentUser: User?
  @Published var selectedItem: PhotosPickerItem? {
    didSet {
      Task { await loadImage() }
    }
  }
  @Published var profileImage: Image?
  
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
  
  private func loadImage() async {
      guard let item = selectedItem,
            let data = try? await item.loadTransferable(type: Data.self),
            let uiImage = UIImage(data: data) else { return }

      profileImage = Image(uiImage: uiImage)
  }
}

//
//  EditProfileViewModel.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import Combine
import PhotosUI
import SwiftUI

final class EditProfileViewModel: ObservableObject {
  @Published var selectedItem: PhotosPickerItem? {
    didSet {
      Task { await loadImage() }
    }
  }
  @Published var profileImage: Image?
  private var uiImage: UIImage?
  
  func updateUserData() async throws {
    try await updateProfileImage()
  }
  
  private func loadImage() async {
    guard let item = selectedItem,
          let data = try? await item.loadTransferable(type: Data.self),
          let uiImage = UIImage(data: data) else { return }

    self.uiImage = uiImage
    profileImage = Image(uiImage: uiImage)
  }
  
  private func updateProfileImage() async throws {
    guard let image = uiImage else { return }
    guard let imageURL = try? await ImageUploader.uploadImage(image) else { return }
    try await UserService.shared.updateUserProfileImage(withImageURL: imageURL)
  }
}

//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
  let user: User
  @State private var bio = ""
  @State private var link = ""
  @State private var isPrivateProfile = false
  @Environment(\.dismiss) var dismiss
  @StateObject var viewModel = EditProfileViewModel()
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color(.systemGroupedBackground)
          .edgesIgnoringSafeArea([.bottom, .horizontal])
        
        VStack {
          nameAndProfileImage
          
          Divider()
          
          bioField
          
          Divider()
          
          linkField
          
          Divider()
          
          Toggle("Private profile", isOn: $isPrivateProfile)
        }
        .font(.footnote)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(.white)
            .stroke(Color(.systemGray4))
        )
        .padding()
      }
      .navigationTitle("Edit Profile")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") {
            dismiss()
          }
          .font(.subheadline)
          .foregroundStyle(.black)
        }
        
        ToolbarItem(placement: .topBarTrailing) {
          Button("Done") {
            Task {
              try await viewModel.updateUserData()
              dismiss()
            }
          }
          .font(.subheadline.weight(.semibold))
          .foregroundStyle(.black)
        }
      }
    }
  }
  
  private var nameAndProfileImage: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("Name")
          .fontWeight(.semibold)
        
        Text(user.fullName)
      }
      
      Spacer()
      
      PhotosPicker(selection: $viewModel.selectedItem) {
        if let image = viewModel.profileImage {
          image
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(.circle)
        } else {
          CircularAvatarView(user: user)
        }
      }
    }
  }
  
  private var bioField: some View {
    VStack(alignment: .leading) {
      Text("Bio")
      
      TextField("Enter you bio...", text: $bio, axis: .vertical)
    }
  }
  
  private var linkField: some View {
    VStack(alignment: .leading) {
      Text("Link")
      
      TextField("Add link...", text: $link)
    }
  }
}

#Preview {
  EditProfileView(user: .mock)
}

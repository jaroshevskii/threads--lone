//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct EditProfileView: View {
  @State private var bio = ""
  @State private var link = ""
  @State private var isPrivateProfile = false
  
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
            
          }
          .font(.subheadline)
          .foregroundStyle(.black)
        }
        
        ToolbarItem(placement: .topBarTrailing) {
          Button("Done") {
            
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
        
        Text("Chalres Leclerc")
      }
      
      Spacer()
      
      CircularProfileImageView()
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
  EditProfileView()
}

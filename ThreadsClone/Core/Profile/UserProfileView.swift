//
//  UserProfileView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct UserProfileView: View {
  let user: User

  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        ProfileHeaderView(user: user)
        
        Button("Follow") {
          
        }
        .buttonStyle(.threadsPrimary)
        
        UserContentListView()
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .scrollIndicators(.hidden)
    .padding(.horizontal)
  }
}

#Preview {
  UserProfileView(user: .mock)
}

//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
  @StateObject var viewModel = CurrentUserProfileViewModel()
  @State private var showsEditProfile = false
  
  // TODO: Refactor this stupid shit
  private var filterBarWidth: Double {
    let count = Double(ProfileThreadFilter.allCases.count)
    return UIScreen.main.bounds.width / count - 20
  }
  
  private var currentUser: User? {
    viewModel.currentUser
  }
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 20) {
          ProfileHeaderView(user: currentUser)

          Button("Edit Profile") {
            showsEditProfile = true
          }
          .buttonStyle(.threadsSecondary)
          
          UserContentListView()
        }
      }
      .scrollIndicators(.hidden)
      .padding(.horizontal)
      .sheet(isPresented: $showsEditProfile) {
        if let currentUser {
          EditProfileView(user: currentUser)
        }
      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            AuthService.shared.signOut()
          } label: {
            Image(systemName: "line.3.horizontal")
          }
        }
      }
    }
  }
}

#Preview {
  CurrentUserProfileView()
}

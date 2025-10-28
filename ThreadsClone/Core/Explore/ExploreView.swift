//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct ExploreView: View {
  @StateObject private var viewModel = ExploreViewModel()
  @State private var searchText = ""
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack {
          ForEach(viewModel.users) { user in
            NavigationLink(value: user) {
              VStack {
                UserCell(user: user)
                
                Divider()
              }
              .padding(.vertical, 4)
            }
          }
        }
      }
      .navigationDestination(for: User.self) { user in
        ProfileView()
      }
      .navigationTitle("Search")
      .searchable(text: $searchText, prompt: "Search")
      .task { try? await viewModel.fetchUsers() }
    }
  }
}

#Preview {
  ExploreView()
}

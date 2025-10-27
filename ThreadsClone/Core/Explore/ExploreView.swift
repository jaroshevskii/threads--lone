//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct ExploreView: View {
  @State private var searchText = ""
  
  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(0..<10, id: \.self) { user in
          VStack {
            UserCell()
            
            Divider()
          }
          .padding(.vertical, 4)
        }
      }
    }
    .navigationTitle("Search")
    .searchable(text: $searchText, prompt: "Search")
  }
}

#Preview {
  NavigationStack {
    ExploreView()
  }
}

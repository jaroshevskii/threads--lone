//
//  ThreadsTabView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct ThreadsTabView: View {
  @State private var selectedTab: Tab = .feed
  @State private var isPresentingUpload = false

  enum Tab: Int, CaseIterable {
    case feed, explore, upload, activity, profile

    var symbolName: String {
      switch self {
      case .feed: "house"
      case .explore: "magnifyingglass"
      case .upload: "plus.circle"
      case .activity: "heart"
      case .profile: "person"
      }
    }
  }

  var body: some View {
    TabView(selection: $selectedTab) {
      ForEach(Tab.allCases, id: \.self) { tab in
        tabContent(for: tab)
          .tabItem {
            Image(systemName: tab.symbolName)
          }
          .tag(tab)
      }
    }
    .tint(.black)
    .onChange(of: selectedTab) { oldValue, newValue in
      if newValue == .upload {
        isPresentingUpload = true
      }
    }
    .sheet(isPresented: $isPresentingUpload) {
      CreateThreadView()
        .onAppear {
          selectedTab = .feed
        }
    }
  }

  @ViewBuilder
  private func tabContent(for tab: Tab) -> some View {
    switch tab {
    case .feed:
      FeedView()
    case .explore:
      ExploreView()
    case .upload:
      Color.clear
    case .activity:
      ActivityView()
    case .profile:
      ProfileView()
    }
  }
}

#Preview {
  ThreadsTabView()
}

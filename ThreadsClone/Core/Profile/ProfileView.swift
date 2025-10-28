//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct ProfileView: View {
  @StateObject var viewModel = ProfileViewModel()
  @State private var selectedFilter = ProfileThreadFilter.threads
  @Namespace var animation
  
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
          HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
              VStack(alignment: .leading) {
                Text(currentUser?.fullName ?? "")
                  .font(.title2)
                  .fontWeight(.semibold)
                
                Text(currentUser?.username ?? "")
              }
              
              if let bio = currentUser?.bio {
                Text(bio)
                  .font(.footnote)
              }

              Text("2 followers")
                .font(.caption)
                .foregroundStyle(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView()
          }
          
          Button("Follow") {
            
          }
          .buttonStyle(.threadsPrimary)
          
          VStack {
            HStack {
              ForEach(ProfileThreadFilter.allCases) { filter in
                VStack {
                  Text(filter.title)
                    .font(.subheadline.weight(selectedFilter == filter ? .semibold : .regular))
                  
                  if selectedFilter == filter {
                    Rectangle()
                      .foregroundStyle(.black)
                      .frame(width: filterBarWidth, height: 1)
                      .matchedGeometryEffect(id: "item", in: animation)
                  } else {
                    Rectangle()
                      .foregroundStyle(.clear)
                      .frame(width: filterBarWidth, height: 1)
                  }
                }
                .onTapGesture {
                  withAnimation(.spring) {
                    selectedFilter = filter
                  }
                }
              }
            }
            
            LazyVStack {
              ForEach(0..<10, id: \.self) { thread in
                ThreadCell()
              }
            }
          }
          .padding(.vertical, 8)
        }
      }
      .scrollIndicators(.hidden)
      .padding(.horizontal)
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
  ProfileView()
}

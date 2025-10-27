//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct FeedView: View {
  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(0..<10, id: \.self) { thread in
          ThreadCell()
        }
      }
    }
    .refreshable {
      print("DEBUG: Refresh threads")
    }
    .scrollIndicators(.hidden)
    .navigationTitle("Threads")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      Button {
        
      } label: {
        Image(systemName: "arrow.counterclockwise")
          .foregroundStyle(.black)
      }
    }
  }
}

#Preview {
  NavigationView {
    FeedView()
  }
}

struct ThreadCell: View {
  var body: some View {
    VStack {
      HStack(alignment: .top) {
        CircularProfileImageView()
        
        VStack(alignment: .leading, spacing: 4) {
          HStack {
            Text("unreleased43")
            
            Spacer()
            
            Text("10m")
              .font(.caption)
              .foregroundStyle(Color(.systemGray2))
            
            Button {
              
            } label: {
              Image(systemName: "ellipsis")
                .foregroundStyle(Color(.darkGray))
            }
          }
        
          Text("Some shit post message for all subscribes, lol")
            .font(.footnote)
            .multilineTextAlignment(.leading)
          
          HStack(spacing: 16) {
            Button {
            } label: {
              Image(systemName: "heart")
            }
            Button {
            } label: {
              Image(systemName: "bubble.right")
            }
            Button {
            } label: {
              Image(systemName: "arrow.rectanglepath")
            }
            Button {
            } label: {
              Image(systemName: "paperplane")
            }
          }
          .padding(.vertical, 8)
          .foregroundStyle(.black)
        }
      }
      
      Divider()
    }
    .padding()
  }
}

#Preview("ThreadCell") {
  ThreadCell()
}

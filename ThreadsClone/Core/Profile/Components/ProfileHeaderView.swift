//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/28/25.
//

import SwiftUI

struct ProfileHeaderView: View {
  var user: User?
  
  var body: some View {
    HStack(alignment: .top) {
      VStack(alignment: .leading, spacing: 12) {
        VStack(alignment: .leading) {
          Text(user?.fullName ?? "")
            .font(.title2)
            .fontWeight(.semibold)
          
          Text(user?.username ?? "")
        }
        
        if let bio = user?.bio {
          Text(bio)
            .font(.footnote)
        }
        
        Text("2 followers")
          .font(.caption)
          .foregroundStyle(.gray)
      }
      
      Spacer()
      
      CircularAvatarView(user: user)
    }
  }
}

#Preview {
  ProfileHeaderView(user: .mock)
}

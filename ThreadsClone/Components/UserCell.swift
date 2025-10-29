//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct UserCell: View {
  let user: User
  
  var body: some View{
    HStack {
      CircularAvatarView(user: user)
      
      VStack(alignment: .leading, spacing: 2) {
        Text(user.username)
          .fontWeight(.semibold)
        
        Text(user.fullName)
      }
      .font(.footnote)
      
      Spacer()
      
      Text("Follow")
        .font(.subheadline)
        .fontWeight(.semibold)
        .frame(width: 100, height: 32)
        .overlay {
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color(.systemGray4), lineWidth: 1)
        }
    }
    .padding(.horizontal)
  }
}

#Preview {
  UserCell(user: .mock)
}

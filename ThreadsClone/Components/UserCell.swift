//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct UserCell: View {
  var body: some View{
    HStack {
      CircularProfileImageView()
      
      VStack(alignment: .leading) {
        Text("username35")
          .fontWeight(.semibold)
        
        Text("Some Name")
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
  UserCell()
}

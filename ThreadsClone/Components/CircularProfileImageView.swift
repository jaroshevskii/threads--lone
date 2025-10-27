//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
      Image(.avatarSample)
        .resizable()
        .scaledToFill()
        .frame(width: 40, height: 40)
        .clipShape(.capsule)
    }
}

#Preview {
    CircularProfileImageView()
}

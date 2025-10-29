//
//  CircularAvatarView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI
import Kingfisher

struct CircularAvatarView: View {
  var user: User?
  
  @Environment(\.circularAvatarSize) var avatarSize
  
  var body: some View {
    KFImage(profileImageURL)
      .placeholder {
        Image(systemName: "person.circle.fill")
          .resizable()
          .foregroundStyle(Color(.systemGray4))
      }
      .resizable()
      .scaledToFill()
      .frame(width: avatarSize.dimension, height: avatarSize.dimension)
      .clipShape(.circle)
  }

  var profileImageURL: URL? {
    if let urlString = user?.profileImageURL {
      URL(string: urlString)
    } else {
      nil
    }
  }
}

#Preview {
  CircularAvatarView(user: .mock)
}

#Preview("Sizes Grid") {
  let sizes: [CircularAvatarSize] = [
    .extraExtraSmall, .extraSmall, .small, .medium, .large, .extraLarge
  ]
  
  LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
    ForEach(sizes, id: \.self) { size in
      VStack {
        Group {
          CircularAvatarView(user: .mockMinimal)
          CircularAvatarView(user: .mock)
        }
        .circularAvatarSize(size)

        Text(size.displayName)
          .font(.caption)
          .foregroundStyle(.secondary)
      }
    }
  }
}

enum CircularAvatarSize: CaseIterable, Hashable {
  case extraExtraSmall, extraSmall, small, medium, large, extraLarge
}

fileprivate extension CircularAvatarSize {
  var dimension: Double {
    switch self {
    case .extraExtraSmall: 28
    case .extraSmall: 32
    case .small: 40
    case .medium: 48
    case .large: 64
    case .extraLarge: 80
    }
  }
  
  var displayName: String {
    switch self {
    case .extraExtraSmall: "XXS"
    case .extraSmall: "XS"
    case .small: "Small"
    case .medium: "Medium"
    case .large: "Large"
    case .extraLarge: "XL"
    }
  }
}

extension EnvironmentValues {
  @Entry var circularAvatarSize = CircularAvatarSize.small
}

extension View {
  func circularAvatarSize(_ size: CircularAvatarSize) -> some View {
    environment(\.circularAvatarSize, size)
  }
}

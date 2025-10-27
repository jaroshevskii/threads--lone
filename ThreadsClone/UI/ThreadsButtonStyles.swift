//
//  ThreadsButtonStyles.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct ThreadsPrimaryButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.subheadline.weight(.semibold))
      .foregroundColor(.white)
      .padding(.vertical, 12)
      .padding(.horizontal, 24)
      .frame(maxWidth: .infinity)
      .background(configuration.isPressed ? Color.gray : Color.black)
      .cornerRadius(8)
      .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
      .animation(
        .spring(response: 0.3, dampingFraction: 0.6),
        value: configuration.isPressed
      )
  }
}

extension ButtonStyle where Self == ThreadsPrimaryButtonStyle {
  static var threadsPrimary: ThreadsPrimaryButtonStyle { ThreadsPrimaryButtonStyle() }
}

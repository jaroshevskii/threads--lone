//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ContentViewModel()
  
  var body: some View {
    Group {
      if viewModel.userSession != nil {
        ThreadsTabView()
      } else {
        LoginView()
      }
    }
  }
}

#Preview {
  ContentView()
}

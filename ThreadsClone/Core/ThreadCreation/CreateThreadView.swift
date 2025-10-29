//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by Sasha Jaroshevskii on 10/27/25.
//

import SwiftUI

struct CreateThreadView: View {
  @State private var caption = ""
  
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    NavigationStack {
      VStack {
        VStack {
          HStack(alignment: .top) {
            CircularAvatarView(user: nil)
            
            VStack(alignment: .leading) {
              Text("somename34")
              
              TextField("Start a thread...", text: $caption, axis: .vertical)
            }
            .font(.footnote)
            
            Spacer()
            
            if !caption.isEmpty {
              Button {
                caption = ""
              } label: {
                Image(systemName: "xmark")
                  .resizable()
                  .frame(width: 12, height: 12)
                  .foregroundStyle(.gray)
              }
            }
          }
        }
        
        Spacer()
      }
      .padding()
      .navigationTitle("New Thread")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") {
            dismiss()
          }
          .font(.subheadline)
          .foregroundStyle(.black)
        }
        
        ToolbarItem(placement: .topBarTrailing) {
          Button("Post") {
            
          }
          .buttonStyle(.threadsToolbarText)
          .disabled(caption.isEmpty)
        }
      }
    }
  }
}

#Preview {
  CreateThreadView()
}

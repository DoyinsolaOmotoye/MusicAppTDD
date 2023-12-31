//
//  SearchBar.swift
//  MusicAppTDD
//
//  Created by President Raindas on 07/09/2023.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .keyboardType(.webSearch)
            
            if isEditing {
                Button(action: {
                    withAnimation(.default) {
                        self.isEditing = false
                        self.text = ""
                    }
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: Binding.constant(""))
    }
}

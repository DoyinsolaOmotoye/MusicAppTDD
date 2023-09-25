//
//  ContentView.swift
//  MusicAppTDD
//
//  Created by President Raindas on 24/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var playlistVM = PlaylistVM()
    
    var body: some View {
        TabView {
            SongsView()
                .tabItem {
                    Label("Songs", systemImage: "music.note")
                }
            
            PlayListView()
                .tabItem {
                    Label("PLaylist", systemImage: "music.note.list")
                }
        }
        .accentColor(.red)
        .environmentObject(playlistVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

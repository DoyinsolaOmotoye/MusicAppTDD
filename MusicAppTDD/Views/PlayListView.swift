//
//  PlayListView.swift
//  MusicAppTDD
//
//  Created by President Raindas on 07/09/2023.
//

import SwiftUI

struct PlayListView: View {
    
    @EnvironmentObject var vm: PlaylistVM
    
    @State private var searchText = ""
    @State private var songScreenShowing:Bool = false
    @State private var selectedSong:Song? = nil
    
    var body: some View {
        
        NavigationStack {
            List {
                if (vm.playlist.count < 1) {
                    Text("Playlist is empty")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(Array(vm.playlist.enumerated()), id: \.element) { index, song in
                        
                        Button {
                            self.selectedSong = song
                            self.songScreenShowing.toggle()
                        } label: {
                            HStack {
                                
                                AsyncImage(url: URL(string: song.cover)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)
                                
                                VStack(alignment: .leading) {
                                    Text(song.title)
                                        .font(.title2)
                                        .foregroundColor(.primary)
                                        .lineLimit(1)
                                    Text(song.artiste)
                                        .foregroundColor(.secondary)
                                }.padding(.leading)
                                
                                Spacer()
                                
                                Menu {
                                    Button {
                                        vm.removeFromPlaylist(index: index)
                                    } label: {
                                        Label("Remove from playlist", systemImage: "trash")
                                    }
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        
                    }.onDelete { indexSet in
                        for index in indexSet{
                            vm.removeFromPlaylist(index: index)
                        }
                    }
                }
            }
            .navigationTitle("Playlist")
        }
        .searchable(text: $searchText)
        .fullScreenCover(item: $selectedSong, content: { song in
            SongView(cover: song.cover, title: song.title, artiste: song.artiste, song: song.song, songSreenShowing: $songScreenShowing)
        })
        
    }
    
}

struct PlayListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayListView().environmentObject(PlaylistVM())
    }
}

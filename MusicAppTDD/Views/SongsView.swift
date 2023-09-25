//
//  SearchView.swift
//  MusicAppTDD
//
//  Created by President Raindas on 07/09/2023.
//

import SwiftUI

struct SongsView: View {
    
    @State private var searchText = ""
    @State private var songScreenShowing:Bool = false
    @ObservedObject var vm = SongsVM()
    @EnvironmentObject var PlaylistVM: PlaylistVM
    
    @State private var selectedSong:Song? = nil
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.songs) { song in
                    
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
                                    PlaylistVM.addToPlaylist(song: song)
                                } label: {
                                    Label("Add to playlist", systemImage: "plus")
                                }
                            } label: {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Songs")
        }
        .searchable(text: $searchText)
        .fullScreenCover(item: $selectedSong, content: { song in
            SongView(cover: song.cover, title: song.title, artiste: song.artiste, song: song.song, songSreenShowing: $songScreenShowing)
        })
//        .fullScreenCover(isPresented: $songScreenShowing) {
//            SongView(cover: selectedCover, title: selectedTitle, artiste: selectedArtiste, song: selectedSong, songSreenShowing: $songScreenShowing)
//        }
    }
    
}

struct SongsView_Previews: PreviewProvider {
    static var previews: some View {
        SongsView().environmentObject(PlaylistVM())
    }
}

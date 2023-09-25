//
//  SongListItem.swift
//  MusicAppTDD
//
//  Created by President Raindas on 07/09/2023.
//

import SwiftUI

struct SongView: View {
    
    let cover:String
    let title:String
    let artiste:String
    let song:String
    @Binding var songSreenShowing:Bool
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vm = SongVM()
    
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                
                Button {
//                    self.songSreenShowing.toggle()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.primary)
                }
            }
            
            Spacer()
            
            AsyncImage(url: URL(string: cover)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 350, height: 350)
            .cornerRadius(20)
            .padding(.top)
            
            VStack {
                Text(title)
                    .font(.title2)
                    .bold()
                Text(artiste)
                    .font(.title3)
                
                if (vm.musicPlaying) {
                    Button {
                        vm.pauseSong()
                    } label: {
                        Image(systemName: "pause.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.red)
                    }.padding(.top)
                } else {
                    Button {
                        vm.playSong(songUrl: song)
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.red)
                    }.padding(.top)
                }
                
                Spacer()
            }
            .padding(.top)
            .alert(isPresented: $vm.showError, content: {
                Alert(
                    title: Text("Error"),
                    message: Text(vm.errorMsg),
                    dismissButton: .destructive(Text("Cancel")) {
                        self.songSreenShowing.toggle()
                    }
                )
            })
            
            Spacer()
            
        }.padding()
    }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
        SongView(cover: "https://cdn.pixabay.com/audio/2023/08/31/14-35-42-339_200x200.jpg", title: "Unavailable", artiste: "Davido", song: "", songSreenShowing: .constant(true))
    }
}

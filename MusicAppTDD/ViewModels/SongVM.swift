//
//  SongVM.swift
//  MusicAppTDD
//
//  Created by President Raindas on 07/09/2023.
//

import Foundation
import AVFAudio

final class SongVM:ObservableObject {
    
    @Published var musicPlaying:Bool = false
    @Published var errorMsg:String = ""
    @Published var showError:Bool = false
    
    var songUrl:String = ""
    var song:AVAudioPlayer?
    
    func playSong(songUrl:String) {
        
        self.songUrl = songUrl
        
        let path =  Bundle.main.path(forResource: songUrl, ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            song = try AVAudioPlayer(contentsOf: url)
            song?.play()
            musicPlaying.toggle()
        } catch {
            errorMsg = "couldn't load file :("
            showError.toggle()
        }
    }
    
    func pauseSong() {
        song?.pause()
        musicPlaying.toggle()
    }
    
    func stopSong() {
        song?.stop()
    }
    
}

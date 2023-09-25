//
//  SongsVM.swift
//  MusicAppTDD
//
//  Created by President Raindas on 07/09/2023.
//

import Foundation

final class SongsVM:ObservableObject {
    let songs = Bundle.main.decode([Song].self, from: "MusicDatabase.json")!
}

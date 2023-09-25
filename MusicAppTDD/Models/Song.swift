//
//  Song.swift
//  MusicAppTDD
//
//  Created by President Raindas on 07/09/2023.
//

import Foundation

struct Song:Codable, Identifiable, Hashable {
    let id: Int
    let cover: String
    let title: String
    let artiste: String
    let song: String
}

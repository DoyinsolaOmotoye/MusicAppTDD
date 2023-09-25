//
//  PlaylistViewModelTests.swift
//  MusicAppTDDTests
//
//  Created by President Raindas on 07/09/2023.
//

import XCTest
@testable import MusicAppTDD 

final class PlaylistViewModelTests: XCTestCase {
    
    var viewModel: PlaylistVM?

    override func setUpWithError() throws {
        viewModel = PlaylistVM()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func test_PlaylistViewModel_playlistArray_shouldBeEmpty() {
        // Given
        
        // When
        let vm = PlaylistVM()
        
        // Then
        XCTAssertTrue(vm.playlist.isEmpty)
        XCTAssertEqual(vm.playlist.count, 0)
    }
    
    func test_PlaylistViewModel_playlistArray_shouldAddToPlaylist() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        } 
        
        // When
        let song = Song(id: 1, cover: "https://cdn.pixabay.com/audio/2023/08/31/14-35-42-339_200x200.jpg", title: "The Best Jazz Club In New Orleans", artiste: "PaoloArgento", song: "the-best-jazz-club-in-new-orleans-164472.mp3")
        
        vm.addToPlaylist(song: song)
        
        // Then
        XCTAssertTrue(!vm.playlist.isEmpty)
        XCTAssertFalse(vm.playlist.isEmpty)
        XCTAssertEqual(vm.playlist.count, 1)
        XCTAssertNotEqual(vm.playlist.count, 0)
        XCTAssertGreaterThan(vm.playlist.count, 0)
    }
    
    func test_PlaylistViewModel_playlistArray_shouldNotAddToPlaylistIfItContainsSong() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        let song = Song(id: 1, cover: "https://cdn.pixabay.com/audio/2023/08/31/14-35-42-339_200x200.jpg", title: "The Best Jazz Club In New Orleans", artiste: "PaoloArgento", song: "the-best-jazz-club-in-new-orleans-164472.mp3")
        
        vm.addToPlaylist(song: song)
        
        vm.addToPlaylist(song: song)
        
        // Then
        XCTAssertEqual(vm.playlist.count, 1)
        XCTAssertNotEqual(vm.playlist.count, 2)
        XCTAssertLessThan(vm.playlist.count, 2)
    }
    
    func test_PlaylistViewModel_playlistArray_shouldRemovePlaylist() {
        // Given
        guard let vm = viewModel else {
            XCTFail()
            return
        }
        
        // When
        let song = Song(id: 1, cover: "https://cdn.pixabay.com/audio/2023/08/31/14-35-42-339_200x200.jpg", title: "The Best Jazz Club In New Orleans", artiste: "PaoloArgento", song: "the-best-jazz-club-in-new-orleans-164472.mp3")
        
        vm.addToPlaylist(song: song)
        
        vm.removeFromPlaylist(index: 0)
        
        // Then
        XCTAssertTrue(vm.playlist.isEmpty)
        XCTAssertFalse(!vm.playlist.isEmpty)
        XCTAssertEqual(vm.playlist.count, 0)
        XCTAssertNotEqual(vm.playlist.count, 1)
        XCTAssertLessThan(vm.playlist.count, 1)
    }

}

//
//  ManageMusicGenres.swift
//  ExameApp
//
//  Created by Сергей Устинов on 16.11.2024.
//

import UIKit

protocol MusicGenreManageable {
    func getMusicGenre() -> MusicGenre
    func addGenre(_ genre: [MusicGenre])
    func getFirstMusicGenre() -> MusicGenre?
    func getLastMusicGenre() -> MusicGenre
    func getNextMusicGenre() -> MusicGenre
    
}

class ManageMusicGenres: MusicGenreManageable {
    
     var music: [MusicGenre] = []
     var nextMusicGenre = 0
    
    
    func getMusicGenre() -> MusicGenre {
        music[nextMusicGenre]
    }
    
    func addGenre(_ genre: [MusicGenre]) {
        for genres in genre {
            music.append(genres)
        }
    }
    
    func getFirstMusicGenre() -> MusicGenre? {
        nextMusicGenre = 0
        return music[nextMusicGenre]
    }
    
    func getLastMusicGenre() -> MusicGenre {
        if nextMusicGenre != 0 {
            nextMusicGenre -= 1
        }
        return getMusicGenre()
    }
    
    
    func getNextMusicGenre() -> MusicGenre {
        if nextMusicGenre < music.count - 1 {
            nextMusicGenre += 1
        }
        return getMusicGenre()
    }
}

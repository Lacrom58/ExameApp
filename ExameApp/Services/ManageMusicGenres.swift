//
//  ManageMusicGenres.swift
//  ExameApp
//
//  Created by Сергей Устинов on 16.11.2024.
//

import UIKit

class ManageMusicGenres {
    
    private var music: [MusicGenre] = []
    private var nextMusicGenre = 0
    
    
    func getMusicGenre() -> MusicGenre {
        music[nextMusicGenre]
    }
    
    func addGenre(_ genre: [MusicGenre]) {
        for genres in genre {
            music.append(genres)
        }
    }
    
    func getFirstMusicGenre() -> MusicGenre? {
        music.first
    }
    
    func getLastMusicGenre() -> MusicGenre {
        if nextMusicGenre < music.count - 1 {
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

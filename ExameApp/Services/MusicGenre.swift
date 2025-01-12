//
//  MusicGenre.swift
//  ExameApp
//
//  Created by Сергей Устинов on 16.11.2024.
//

import Foundation

struct MusicGenre: CustomStringConvertible {
    
    var description: String {
        "Название картинки: \(image), описание: \(fullMusicInfo)."
    }
    
    var image: String
    var fullMusicInfo:String
    
    static func < (lhs: MusicGenre, rhs: MusicGenre) -> Bool {
        lhs.image < rhs.image
    }
    
}



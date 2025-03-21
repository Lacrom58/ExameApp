//
//  MusicGenresRepository.swift
//  ExameApp
//
//  Created by Сергей Устинов on 16.11.2024.
//

import UIKit

protocol RepositoryManagable{
    func getGenre() -> [MusicGenre]
    
}
class MusicGenresRepository: RepositoryManagable{
    
    func getGenre() -> [MusicGenre] {
        return [
            MusicGenre(image: "techno", fullMusicInfo: " Жанр электронной танцевальной музыки, зародившийся в Германии и впоследствии подхваченный американскими продюсерами. Характеризуется искусственностью звука, за счёт активного использования сэмплирования, акцентом на механических ритмах, многократным повторением структурных элементов музыкального произведения (лупы)."),
            MusicGenre(image: "melodic techno", fullMusicInfo: " Поджанр техно-музыки, появившийся в начале 2010-х годов. Он характеризуется своим атмосферным и эмоциональным характером. В этом жанре сочетаются глубокие ритмы и богатые мелодические элементы. Треки часто медленно нарастают, достигают пика, а затем опускаются до более приглушённого уровня"),
            MusicGenre(image: "house", fullMusicInfo: " Cтиль электронной музыки, созданный танцевальными диск-жокеями в начале 1980-х годов в Чикаго и Нью-Йорке. Хаус является производным жанром танцевальных стилей ранней эры пост-диско (электро, хай-энерджи, соул, фанк и т. п.) конца 1970-х годов, однако стиль набрал популярность лишь в конце 1980-х. Основным отличием музыки хаус является повторяемый ритм-бит, обычно в размере 4/4, и семплинг — работа со звуковыми вставками, которые повторяются время от времени, частично совпадая с её ритмом."),
            MusicGenre(image: "bass house", fullMusicInfo: " Это музыкальный стиль, который появился в начале 2010-х годов и быстро завоевал популярность в танцевальной музыке. Этот жанр объединяет элементы бас-музыки и хауса, создавая энергичный и глубокий звук.")
        
        ]
    }
}

//
//  ImageView.swift
//  ExameApp
//
//  Created by Сергей Устинов on 02.12.2024.
//

import UIKit

class ImageView: UIImageView {
    
    var nameImage: String?
    
    init(imageName: String) {
        super.init(frame: .zero)
        setupView()
        setupImage(imageName)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImage(_ imageName: String) {
        image = UIImage(named: imageName)
        layer.cornerRadius = 15
        clipsToBounds = true
        contentMode = .scaleAspectFit
        
    }
    
    private func setupView() {
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
}

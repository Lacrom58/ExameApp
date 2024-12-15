//
//  Buttons.swift
//  ExameApp
//
//  Created by Сергей Устинов on 16.11.2024.
//

import UIKit

class Buttons: UIButton {
    
    init(textButton: String, bgColor: UIColor, textColor: UIColor) {
        super.init(frame: .zero)
        setupButton(text: textButton, bgColor: bgColor, textColor: textColor)
    }
    
    @available(*, deprecated)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Buttons {
    
    func setupButton(text: String, bgColor: UIColor, textColor: UIColor) {
        setTitle(text, for: .normal)
        setTitleColor(textColor, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.5
       
        
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        widthAnchor.constraint(equalToConstant: 100).isActive = true
       

     
       
        
      
    }
}

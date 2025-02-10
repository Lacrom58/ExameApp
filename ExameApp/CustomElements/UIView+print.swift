//
//  UIView+print.swift
//  ExameApp
//
//  Created by Сергей Устинов on 19.01.2025.
//

import UIKit

extension UIView {
    
    func countButtons(_ views: UIView...) -> Int {
        var count = 0
        for view in views {
            if view is Buttons  {
                count+=1
            }
        }
    return count
    }
    
    func printNameButton(_ views: UIView...) {
        
        for view in views {
            if let button = view as? Buttons {
                print(button.buttonName ?? "Unknown name button")
            }
        }
    }
}

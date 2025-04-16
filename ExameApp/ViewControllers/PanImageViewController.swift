//
//  PanImageViewController.swift
//  ExameApp
//
//  Created by Сергей Устинов on 15.04.2025.
//

import UIKit

class PanImageViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private var panGestureAnchorPoint: CGPoint?
    
    private var centerXConstraint: NSLayoutConstraint!
    private var centerYConstraint: NSLayoutConstraint!
    
    var manage: ManageMusicGenres!
    var repository: MusicGenresRepository!
    var genre: MusicGenre!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setupImageView()
        setupLayout()
        setupGestureRecognizer()
        
    }
    
    @objc func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else {return}
        
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else {return}
            
            let gesturePoint = gestureRecognizer.location(in: view)
            
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            centerYConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
            
            
        case .ended, .cancelled:
            panGestureAnchorPoint = nil
        case .possible, .failed:
            break
        @unknown default:
            break
        }
    }
    
    private func setupGestureRecognizer() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        panGestureRecognizer.maximumNumberOfTouches = 1
        imageView.addGestureRecognizer(panGestureRecognizer)
    }

}

extension PanImageViewController {
    private func setupImageView() {
        view.addSubview(imageView)
        imageView.image = UIImage(named: "techno")
        imageView.layer.cornerRadius = Constants.boxCornerRadius
        imageView.clipsToBounds = true

    }
}

extension PanImageViewController {
    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let widhtConstraint = imageView.widthAnchor.constraint(equalToConstant: Constants.initialBoxDimSize)
        
        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: Constants.initialBoxDimSize)
        
        centerXConstraint = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        centerYConstraint = imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            
        widhtConstraint,
        heightConstraint,
        centerXConstraint,
        centerYConstraint
        
        ])
    }
}

private extension PanImageViewController {
    enum Constants {
        static let boxCornerRadius: CGFloat = 10.0
        static let initialBoxDimSize: CGFloat = 250.0
    }
}

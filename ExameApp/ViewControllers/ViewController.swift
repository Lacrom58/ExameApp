//
//  ViewController.swift
//  ExameApp
//
//  Created by Сергей Устинов on 16.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let repository = MusicGenresRepository()
    private let manage = ManageMusicGenres()
    
    private let imageView = ImageView(imageName: ImageViewType.techno.rawValue)
    private let textLabel = UILabel()
    private let stackView = UIStackView()
    
    private let buttonsStack = UIStackView()
    private let buttonOne = Buttons(textButton: "First", bgColor: .red, textColor: .white)
    private let buttonTwo = Buttons(textButton: "Last", bgColor: .systemIndigo, textColor: .white)
    private let buttonThree = Buttons(textButton: "Next", bgColor: .white, textColor: .black)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateGenre()
        
      
        setupStackView()
        view.addSubview(stackView)
        setupButtonsStack()
        view.addSubview(buttonsStack)
        setupLabel()
        addAction()
        addActionTwo()
        addActionThreee()
        setupLayout()
        buttonsConstraints()
        
       
    }
    
    func updateGenre() {
        manage.addGenre(repository.getGenre())
    }
    
    @objc
    private func buttonTapped() {
        let nextMusicGenre = manage.getNextMusicGenre()
        textLabel.text = nextMusicGenre.full
        imageView.image = UIImage(named: nextMusicGenre.image)
    }
    
    @objc
    private func buttonGetLastMusicGenre() {
        let nextMusicGenre = manage.getLastMusicGenre()
        textLabel.text = nextMusicGenre.full
        imageView.image = UIImage(named: nextMusicGenre.image)
        }
    
    @objc
    private func buttonGetFisrtMusicGenre() {
        let getFirst = manage.getFirstMusicGenre()
        textLabel.text = getFirst?.full
        imageView.image  = UIImage(named: getFirst?.image ?? "")
    }
}

// MARK: Buttons Actions
extension ViewController {
    private func addActionTwo(){
        buttonOne.addTarget(
            self,
            action: #selector(buttonGetFisrtMusicGenre),
            for: .touchUpInside)
    }
    
    private func addActionThreee(){
        buttonTwo.addTarget(
            self,
            action: #selector(buttonGetLastMusicGenre),
            for: .touchUpInside)
    }
    
    private func addAction() {
        buttonThree.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside)
    }
}

// MARK: Setup View
extension ViewController {
        
        private func setupStackView() {
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.alignment = .fill
            stackView.spacing = 30
            
            stackView.addArrangedSubview(imageView)
            stackView.addArrangedSubview(textLabel)
            stackView.addArrangedSubview(buttonOne)
            
        }
        
        private func setupButtonsStack() {
            buttonsStack.axis = .horizontal
            buttonsStack.distribution = .fillEqually
            buttonsStack.alignment = .fill
            buttonsStack.spacing = 100
            
            buttonsStack.addArrangedSubview(buttonTwo)
            buttonsStack.addSubview(buttonOne)
            buttonsStack.addArrangedSubview(buttonThree)
            
            
        }
        
        private func setupLabel() {
            let firstNumber = manage.getMusicGenre()
            textLabel.text = firstNumber.description
            textLabel.font = .systemFont(ofSize: 10, weight: .bold)
            textLabel.textColor = .black
            textLabel.textAlignment = .center
            textLabel.numberOfLines = 0
            
        }
    }


// MARK: Buttons Constraints
extension ViewController {
    private func buttonsConstraints() {
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            buttonsStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 600),
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            buttonOne.centerXAnchor.constraint(equalTo: buttonsStack.centerXAnchor),
            buttonOne.bottomAnchor.constraint(equalTo: buttonsStack.bottomAnchor, constant: 150)

        ])
    }
}

// MARK: Setup Layout
extension ViewController {
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
       

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            imageView.heightAnchor.constraint(equalTo: stackView.widthAnchor),
            

        ])
    }
}


// MARK: Nested Types
extension ViewController {
    
    enum ImageViewType: String {
        case techno = "techno"
        case house = "house"
        case bassHouse = "bass house"
        case melodicTechno = "melodic techno"
    }
}

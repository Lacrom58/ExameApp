//
//  ViewController.swift
//  ExameApp
//
//  Created by Сергей Устинов on 16.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView = ImageView(imageName: ImageViewType.techno.rawValue)
    private let textLabel = UILabel()
    private let stackView = UIStackView()
    
    private let buttonsStack = UIStackView()
    private let buttonOne = Buttons(textButton: "First", bgColor: .red, textColor: .white)
    private let buttonTwo = Buttons(textButton: "Last", bgColor: .systemIndigo, textColor: .white)
    private let buttonThree = Buttons(textButton: "Next", bgColor: .white, textColor: .black)
    
    var repository: RepositoryManagable = MusicGenresRepository()
    var manage: MusicGenreManageable!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOne.delegate = self
        buttonTwo.delegate = self
        buttonThree.delegate = self
        buttonOne.buttonName = "Button one"
        buttonTwo.buttonName = "Button two"
        buttonThree.buttonName = "Button three"
        view.printNameButton(buttonOne, buttonTwo, buttonThree)
        view.backgroundColor = .white
        updateGenre()
        
        
    
        setupStackView()
        view.addSubview(stackView)
        setupButtonsStack()
        view.addSubview(buttonsStack)
        view.addSubview(buttonOne)
        setupImage()
        setupLabel()
        addAction()
        addActionTwo()
        addActionThreee()
        setupLayout()
        
        
       
    }
    
    func updateGenre() {
        manage.addGenre(repository.getGenre())
    }
    
    @objc
    private func buttonTapped() {
        getMusicGenres(manage.getNextMusicGenre())
       
    }
    
    @objc
    private func buttonGetLastMusicGenre() {
        getMusicGenres(manage.getLastMusicGenre())
        
    }
    
    @objc
    private func buttonGetFisrtMusicGenre() {
       getMusicGenres(manage.getFirstMusicGenre())
        
    }
    
    private func getMusicGenres(_ value: MusicGenre?) {
        textLabel .text = value?.description
        imageView.image = UIImage(named: value?.image ?? "")
    }
}
// MARK: Button Delegate
extension ViewController: IButtonsDelegate{
    func pressedButton(_ button: UIButton) {
        if button == buttonOne {
            print("Red button pressed")
        } else if button == buttonTwo {
            print("Indigo button pressed")
        } else {
            print("Cyan button pressed")
        }
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
    
    private func setupImage() {
        imageView.image = UIImage(named: manage.getFirstMusicGenre()?.image ?? "")
    }
        
        private func setupStackView() {
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.alignment = .fill
            stackView.spacing = 30
            
            stackView.addArrangedSubview(imageView)
            stackView.addArrangedSubview(textLabel)
            
        }
        
        private func setupButtonsStack() {
            buttonsStack.axis = .horizontal
            buttonsStack.distribution = .fillEqually
            buttonsStack.alignment = .fill
            buttonsStack.spacing = 100
            
            buttonsStack.addArrangedSubview(buttonTwo)
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


// MARK: Setup Layout
extension ViewController {
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
       

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            imageView.heightAnchor.constraint(equalTo: stackView.widthAnchor),
    
            buttonsStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 600),
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                
            buttonOne.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            

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

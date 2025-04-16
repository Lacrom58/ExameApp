//
//  FindImageViewController.swift
//  ExameApp
//
//  Created by Сергей Устинов on 15.03.2025.
//

import UIKit

class FindImageViewController: UIViewController {
    
    private let label = UILabel()
    private let textField = UITextField()
    private let button = UIButton()
    private let infoMessage = UILabel()
    private let imageView = UIImageView()
    
    var manage: ManageMusicGenres!
    var repository: MusicGenresRepository!
    var genre: MusicGenre!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(infoMessage)
        view.addSubview(button)
        view.addSubview(imageView)
        view.backgroundColor = .white
        setupLabel()
        setupTextField()
        setupButton()
        setupImage()
        setupLayout()
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        textField.endEditing(true)
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textField {
            textField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
   
    
    private func setupLabel() {
        label.text = "Введите название картинки"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
    }
    
    private func setupTextField() {
        textField.placeholder = "Название картинки"
        textField.borderStyle = .roundedRect
    }
    private func setupButton() {
        button.setTitle("Проверить", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
    }
    private func setupImage() {
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
    }
}

extension FindImageViewController {
    private func setupLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
          
            
        ])
        
       
    }
}

func showText() {
    print("Some text")
}

extension FindImageViewController: IButtonsDelegate {
    func pressedButton(_ button: UIButton) {
        if button == button {
            showText()
        } else {
            print("Button pressed")
        }
    }
    
}

extension FindImageViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
  
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        let manage = manage.searchImageName(text)
       
        
        if let image = manage?.image {
            label.text = image
            imageView.image = UIImage(named: image )
        } else {
            label.text = "Такой картинки нет"
            
        }
        textField.resignFirstResponder()
    }
}



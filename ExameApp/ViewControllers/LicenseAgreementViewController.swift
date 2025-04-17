//
//  LicenseAgreementViewController.swift
//  ExameApp
//
//  Created by Сергей Устинов on 16.04.2025.
//

import UIKit

class LicenseAgreementViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let label = UILabel()
    private let titleLabel = UILabel()
    
   var scrollManage: TextManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupView()
        getTextLabel()
        setupLayout()
        

       
    }
    
    private func getTextLabel() {
        label.text = scrollManage.getText()
        titleLabel.text = scrollManage.getTitle()
    }

}

private extension LicenseAgreementViewController {
    
    func setupView() {
        addSubView()
        setupTitle()
        setupLabel()
        setupScrollView()
    }
    
    func addSubView(){
        view.addSubview(scrollView)
    }
}

private extension LicenseAgreementViewController {
    
    func setupScrollView() {
        scrollView.backgroundColor = .lightGray
        scrollView.addSubview(contentView)
    }
}

private extension LicenseAgreementViewController {
    
    func setupLabel() {
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        contentView.addSubview(label)
    }
    func setupTitle() {
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        contentView.addSubview(titleLabel)
    }
}

//MARK: Layout
private extension LicenseAgreementViewController {
    
    func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 3000),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
            label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
           ])
        
        }
    }


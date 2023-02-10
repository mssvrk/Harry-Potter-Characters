//
//  CharacterInfoView.swift
//  Harry Potter Characters
//
//  Created by Mac on 06/02/2023.
//  Copyright © 2023 mssvrk. All rights reserved.
//

import UIKit

class CharacterInfoView: UIView {
    
    // MARK: Properties
    
    // view as backgrund for mainStackView
    lazy var characterContentView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var upperStack: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    lazy var lowerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 1
        
        return stackView
    }()
    
    
    lazy var infoView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        // corner radius only for top left and right corners
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return view
    }()
    
    lazy var imageViewContentView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        return view
    }()
    
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    // LABELS
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var wizardLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var houseLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var dobLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var ancestryLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var patronusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var speciesLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var actorLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var aliveLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    lazy var wandLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    // MARK: INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
        setupLayout()
        
    }
    
    
    // MARK: Setting View Components
    
    func setupView() {
        
        // Adding subviews back-to-front
        addSubview(characterContentView)
        
        characterContentView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(upperStack)
        mainStackView.addArrangedSubview(infoView)
        
        upperStack.addArrangedSubview(imageViewContentView)
        infoView.addSubview(lowerStack)
        
        imageViewContentView.addSubview(imageView)

        lowerStack.addArrangedSubview(genderLabel)
        lowerStack.addArrangedSubview(dobLabel)
        lowerStack.addArrangedSubview(wizardLabel)
        lowerStack.addArrangedSubview(aliveLabel)
        lowerStack.addArrangedSubview(speciesLabel)
        lowerStack.addArrangedSubview(ancestryLabel)
        lowerStack.addArrangedSubview(houseLabel)
        lowerStack.addArrangedSubview(patronusLabel)
        lowerStack.addArrangedSubview(wandLabel)
        lowerStack.addArrangedSubview(actorLabel)
        
        
    }
    
    func setupLayout() {
        
        
        NSLayoutConstraint.activate([
            characterContentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            characterContentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            characterContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            characterContentView.rightAnchor.constraint(equalTo: self.rightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: characterContentView.topAnchor),
            mainStackView.leftAnchor.constraint(equalTo: characterContentView.leftAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: characterContentView.bottomAnchor),
            mainStackView.rightAnchor.constraint(equalTo: characterContentView.rightAnchor)
            ])
        
        // mainStack distribution .fillProportionally so we set height for infoView:
        infoView.heightAnchor.constraint(equalTo: characterContentView.heightAnchor, multiplier: 0.7).isActive = true
        
        imageViewContentView.widthAnchor.constraint(equalTo: characterContentView.widthAnchor, multiplier: 0.5).isActive = true

        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageViewContentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: imageViewContentView.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageViewContentView.bottomAnchor),
            imageView.rightAnchor.constraint(equalTo: imageViewContentView.rightAnchor)
            ])

        
        NSLayoutConstraint.activate([
            lowerStack.topAnchor.constraint(equalTo: infoView.topAnchor),
            lowerStack.leftAnchor.constraint(equalTo: infoView.leftAnchor),
            lowerStack.bottomAnchor.constraint(equalTo: infoView.bottomAnchor),
            lowerStack.rightAnchor.constraint(equalTo: infoView.rightAnchor)
            ])
        
        
    }
}

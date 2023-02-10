//
//  CharacterCell.swift
//  Harry Potter Characters
//
//  Created by Mac on 02/02/2023.
//  Copyright © 2023 mssvrk. All rights reserved.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    // MARK: Properties

    let cellContentView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .darkCells
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        return view
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .goldTextTwo
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = UIFont(name: "DatingHistoriaRegular", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

        capsuleForm(for: self)
    }

    
    // MARK: UI & Auto Layout
    
    func setupView() {
        
        self.clipsToBounds = true
        
        addSubview(cellContentView)
        cellContentView.addSubview(nameLabel)
        
    }
    
    func setupLayout() {
        
        // cellContentView:
        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: self.topAnchor),
            cellContentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            cellContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cellContentView.rightAnchor.constraint(equalTo: self.rightAnchor)])

        // nameLabel
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: cellContentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: cellContentView.centerYAnchor)
            ])
        
        
    }
}

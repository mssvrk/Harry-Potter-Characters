//
//  CharacterDetailInfoController.swift
//  Harry Potter Characters
//
//  Created by Mac on 06/02/2023.
//  Copyright © 2023 mssvrk. All rights reserved.
//

import UIKit

class CharacterDetailInfoController: UIViewController {
    
    // MARK: Properties
    
    var character: Character? {
        didSet {
            

            guard let gender = character?.gender else { return }
            guard let species = character?.species else { return }
            guard let wizard = character?.wizard else { return }
            guard let house = character?.house else { return }
            guard let ancestry = character?.ancestry else { return }
            guard let patronus = character?.patronus else { return }
            guard let alive = character?.alive else { return }
            guard let actor = character?.actor else { return }
            guard let wandWood = character?.wand?.wood else { return }
            guard let wandCore = character?.wand?.core else { return }
            
            // Checking if dateOfBirth or yearOfBirth contains empty String or nil, respectively
            var dateOB = ""
            var yearOB = 0
            // dateOfBirth
            if character?.dateOfBirth != nil && character?.dateOfBirth != "" {
                dateOB = character!.dateOfBirth!
            } else {
                dateOB = ""
            }
            // yearOfBirth
            if character?.yearOfBirth != nil {
                yearOB = character!.yearOfBirth!
            } else {
                yearOB = 0
            }
            
            var dobText = ""
            
            
            // Checking if there's any date/yearOfBirth to display
            if dateOB.count > 2 {
                dobText = dateOB.replacingOccurrences(of: "-", with: ".")
            } else if dateOB == "" && yearOB > 2 {
                dobText = "\(yearOB)"
            } else {
                dobText = "Unknown"
            }
            
            let genderText = gender == "" ? "Unknown" : gender.capitalized
            let speciesText = species == "" ? "Unknown" : species.capitalized
            let wizardText = wizard == true ? "Yes" : "No"
            let houseText = house == "" ? "Unknown" : house
            let ancestryText = ancestry == "" ? "Unknown" : ancestry.capitalized
            let patronusText = patronus == "" ? "Unknown" : patronus.capitalized
            let aliveText = alive == true ? "Yes" : "No"
            let actorText = actor == "" ? "Unavailable" : actor
            let woodText = wandWood == "" ? "Unknown" : wandWood
            let coreText = wandCore == "" ? "Unknown" : wandCore
            
            
            customizingLabels(label: detailView.genderLabel, title: "Gender", details: genderText)
            customizingLabels(label: detailView.dobLabel, title: "DOB", details: dobText)
            customizingLabels(label: detailView.aliveLabel, title: "Alive", details: aliveText)
            customizingLabels(label: detailView.wizardLabel, title: "Wizard", details: wizardText)
            customizingLabels(label: detailView.speciesLabel, title: "Species", details: speciesText)
            customizingLabels(label: detailView.actorLabel, title: "Actor", details: actorText)
            customizingLabels(label: detailView.houseLabel, title: "House", details: houseText)
            customizingLabels(label: detailView.ancestryLabel, title: "Ancestry", details: ancestryText)
            customizingLabels(label: detailView.patronusLabel, title: "Patronus", details: patronusText)
            customizingLabels(label: detailView.wandLabel, title: "Wand", details: "\(woodText) wood, \(coreText) core")
            
            // Changing colors depending on House
            switch house {
            case "Gryffindor":
                detailView.infoView.backgroundColor = .gryffindorGold
                detailView.genderLabel.textColor = .gryffindorRed
                detailView.wizardLabel.textColor = .gryffindorRed
                detailView.aliveLabel.textColor = .gryffindorRed
                detailView.dobLabel.textColor = .gryffindorRed
                detailView.speciesLabel.textColor = .gryffindorRed
                detailView.ancestryLabel.textColor = .gryffindorRed
                detailView.houseLabel.textColor = .gryffindorRed
                detailView.patronusLabel.textColor = .gryffindorRed
                detailView.actorLabel.textColor = .gryffindorRed
                detailView.wandLabel.textColor = .gryffindorRed
            case "Slytherin":
                detailView.infoView.backgroundColor = .slytherinGreen
                detailView.genderLabel.textColor = .slytherinSilver
                detailView.wizardLabel.textColor = .slytherinSilver
                detailView.aliveLabel.textColor = .slytherinSilver
                detailView.dobLabel.textColor = .slytherinSilver
                detailView.speciesLabel.textColor = .slytherinSilver
                detailView.ancestryLabel.textColor = .slytherinSilver
                detailView.houseLabel.textColor = .slytherinSilver
                detailView.patronusLabel.textColor = .slytherinSilver
                detailView.actorLabel.textColor = .slytherinSilver
                detailView.wandLabel.textColor = .slytherinSilver
            case "Hufflepuff":
                detailView.infoView.backgroundColor = .hufflepuffBrown
                detailView.genderLabel.textColor = .hufflepuffYellow
                detailView.wizardLabel.textColor = .hufflepuffYellow
                detailView.aliveLabel.textColor = .hufflepuffYellow
                detailView.dobLabel.textColor = .hufflepuffYellow
                detailView.speciesLabel.textColor = .hufflepuffYellow
                detailView.ancestryLabel.textColor = .hufflepuffYellow
                detailView.houseLabel.textColor = .hufflepuffYellow
                detailView.patronusLabel.textColor = .hufflepuffYellow
                detailView.actorLabel.textColor = .hufflepuffYellow
                detailView.wandLabel.textColor = .hufflepuffYellow
            case "Ravenclaw":
                detailView.infoView.backgroundColor = .ravenclawBlue
                detailView.genderLabel.textColor = .ravenclawBronze
                detailView.wizardLabel.textColor = .ravenclawBronze
                detailView.aliveLabel.textColor = .ravenclawBronze
                detailView.dobLabel.textColor = .ravenclawBronze
                detailView.speciesLabel.textColor = .ravenclawBronze
                detailView.ancestryLabel.textColor = .ravenclawBronze
                detailView.houseLabel.textColor = .ravenclawBronze
                detailView.patronusLabel.textColor = .ravenclawBronze
                detailView.actorLabel.textColor = .ravenclawBronze
                detailView.wandLabel.textColor = .ravenclawBronze
            default:
                detailView.characterContentView.backgroundColor = .lighterBlack
                detailView.infoView.backgroundColor = .darkCells
                detailView.genderLabel.textColor = .goldTextTwo
                detailView.wizardLabel.textColor = .goldTextTwo
                detailView.aliveLabel.textColor = .goldTextTwo
                detailView.dobLabel.textColor = .goldTextTwo
                detailView.speciesLabel.textColor = .goldTextTwo
                detailView.ancestryLabel.textColor = .goldTextTwo
                detailView.houseLabel.textColor = .goldTextTwo
                detailView.patronusLabel.textColor = .goldTextTwo
                detailView.actorLabel.textColor = .goldTextTwo
                detailView.wandLabel.textColor = .goldTextTwo
            }

        }
    }
    
    lazy var detailView: CharacterInfoView = {
        let view = CharacterInfoView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: Controller Lifecucle
    override func loadView() {
        super.loadView()
        
        setupView()
        setupLayout()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        updateViews()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = character!.name
        
        // navigationItem title attributes
        let attributes = [NSAttributedString.Key.font: UIFont(name: "DatingHistoriaRegular", size: 22)!, NSAttributedString.Key.foregroundColor: UIColor.goldTextTwo]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    // MARK: UI & Auto Layout
    func setupView() {
        
        view.backgroundColor = .darkCells
        
        view.addSubview(detailView)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailView.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
    }
    
    // MARK: Fetching image
    
    func updateViews() {
        
        guard let char = character else { return }
        
        detailView.imageView.image = UIImage(named: "no_image")
        
        NetworkManager.shared.fetchImage(character: char) { (image) in
            DispatchQueue.main.async {
                self.detailView.imageView.image = image
            }
        }
    }
        
    // MARK: Helper Methods
    
    // Method to customize labels appearance with placeholder text, font and color
    func customizingLabels(label: UILabel, title: String, details: String) {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(
            string: "\(title): ",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "DatingHistoriaRegular", size: 25)!]))
        attributedText.append(NSAttributedString(string: "\(details)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "DatingHistoriaRegular", size: 30)!]))
        label.attributedText = attributedText
    }

}

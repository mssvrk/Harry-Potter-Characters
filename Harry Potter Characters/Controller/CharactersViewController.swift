//
//  CharactersViewController.swift
//  Harry Potter Characters
//
//  Created by Mac on 02/02/2023.
//  Copyright © 2023 mssvrk. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CharacterCell"
private let insets = UIEdgeInsets(
    top: 10,
    left: 10,
    bottom: 10,
    right: 10)

private let itemsPerRow: CGFloat = 1


class CharactersViewController: UICollectionViewController {
    
    // MARK: Properties
    
    var characters = [Character]()
    var filteredCharacters = [Character]()
    
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
   
    // MARK: Controller's Lifecycle
    override func loadView() {
        super.loadView()
        
        
        collectionView.backgroundColor = .lighterBlack
        setupNavControllerAppearance()
        settingSearchController()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        fetchCharacter()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering cell
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    // MARK: API
    
    func fetchCharacter() {
        NetworkManager.shared.fetchCharacters { (char) in
            DispatchQueue.main.async {
                self.characters = char
                self.collectionView.reloadData()
            }
        }
    }

    // MARK: Navigation Controller
    
    func setupNavControllerAppearance() {
        navigationController?.navigationBar.barTintColor = .darkController
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .goldTextTwo
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.title = "Characters"
        
        // navigationItem large title attributes
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.goldTextTwo, NSAttributedString.Key.font: UIFont(name: "DatingHistoriaRegular", size: 45)!]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        
        // navigationItem title attributes when it became small while scrolling
        let smallTitleAttr = [
            NSAttributedString.Key.foregroundColor: UIColor.goldTextTwo, NSAttributedString.Key.font: UIFont(name: "DatingHistoriaRegular", size: 22)!]
        navigationController?.navigationBar.titleTextAttributes = smallTitleAttr
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    // MARK: Setting searchController params
    
    func settingSearchController() {
        searchController.isActive = true
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Character"
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Customizing appearance
        let searchTextField = searchController.searchBar.value(forKey: "searchField") as? UITextField

        searchTextField?.backgroundColor = .lighterBlack
        
        searchController.searchBar.tintColor = .goldTextTwo
        
        // Back barButton
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredCharacters = characters.filter { (character: Character) -> Bool in
            return character.name.lowercased().contains(searchText.lowercased())
        }
        collectionView.reloadData()
        
    }
}


// MARK:- Collection View Data Source

extension CharactersViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredCharacters.count
        } else {
            return characters.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CharacterCell
        
        let character: Character

        if isFiltering {
            character = filteredCharacters[indexPath.row]
        } else {
            character = characters[indexPath.row]
        }
        
        cell.nameLabel.text = character.name

        return cell
    }
    
    
}

// MARK:- Collection View Delegate

extension CharactersViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let detailInfoController = CharacterDetailInfoController()
        
        let character = isFiltering ? filteredCharacters[indexPath.row] : characters[indexPath.row]
        detailInfoController.character = character
        
        self.navigationController?.pushViewController(detailInfoController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

// MARK:- Collection View Flow Layout

extension CharactersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = insets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace

        let heightPerItem: CGFloat = 80
        
        return CGSize(width: availableWidth, height: heightPerItem)
    }
}


// MARK:- Search Controller Extensions

extension CharactersViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
}

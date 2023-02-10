//
//  Character.swift
//  Harry Potter Characters
//
//  Created by Mac on 02/02/2023.
//  Copyright © 2023 mssvrk. All rights reserved.
//

import UIKit

struct Wand: Decodable {
    var wood: String?
    var core: String?
}

struct Character: Decodable {
    
    var name: String
    var species: String
    var gender: String
    var house: String
    var dateOfBirth: String?
    var yearOfBirth: Int?
    var wizard: Bool
    var ancestry: String?
    var wand: Wand?
    var patronus: String?
    var actor: String
    var alive: Bool
    var image: String

}



//
//  Extensions.swift
//  Harry Potter Characters
//
//  Created by Mac on 02/02/2023.
//  Copyright © 2023 mssvrk. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MAIN THEME COLORS
    static let darkCells = UIColor(red: 30/255, green: 31/255, blue: 33/255, alpha: 1)
    static let darkController = UIColor(red: 26/255, green: 27/255, blue: 29/255, alpha: 1)
    static let lighterBlack = UIColor(red: 81/255, green: 82/255, blue: 84/255, alpha: 1)
    
    
    // Main theme text color
    static let goldTextTwo = UIColor(red: 240/255, green: 203/255, blue: 15/255, alpha: 1)
    
    // HOUSES COLORS:
    
        // Gryffindor
    static let gryffindorRed = UIColor(red: 116/255, green: 0/255, blue: 1/255, alpha: 1)
    static let gryffindorGold = UIColor(red: 211/255, green: 166/255, blue: 37/255, alpha: 1)
    
        // Slytherin
    static let slytherinGreen = UIColor(red: 26/255, green: 71/255, blue: 42/255, alpha: 1)
    static let slytherinSilver = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1)
    
        // Hufflepuff
    static let hufflepuffBrown = UIColor(red: 46/255, green: 39/255, blue: 31/255, alpha: 1)
    static let hufflepuffYellow = UIColor(red: 255/255, green: 223/255, blue: 0/255, alpha: 1)
    
        // Ravenclaw
    static let ravenclawBlue = UIColor(red: 14/255, green: 26/255, blue: 64/255, alpha: 1)
    static let ravenclawBronze = UIColor(red: 198/255, green: 125/255, blue: 28/255, alpha: 1)
    
}

extension UIView {
    
    func capsuleForm(for view: UIView) {
        view.layer.cornerRadius = bounds.height / 2
        let roundPath = UIBezierPath(roundedRect: bounds, cornerRadius: bounds.height / 2)
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        view.layer.mask = maskLayer
    }
}

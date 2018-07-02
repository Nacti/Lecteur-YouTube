//
//  ChansonCell.swift
//  Youtube
//
//  Created by Cédric PETERSEN on 02/07/2018.
//  Copyright © 2018 Cédric PETERSEN. All rights reserved.
//

import UIKit

class ChansonCell: UITableViewCell {

    @IBOutlet weak var miniature: UIImageView!
    @IBOutlet weak var artisteEtTitreLabel: UILabel!
    
    
    // Création de la variable Chanson tenant de la classe Chanson en non optionnelle pour qu'elle soit absolument présente
    var chanson: Chanson!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
    }

    // Création de la fonction avec comme paramètre la classe Chanson
    func creerCell(_ chanson: Chanson) {
    // Récupération chanson tenant correspondant à la variable créée au début de la classe ChansonCell
    self.chanson = chanson
        
    // Création de la configuration de la première ligne correspondant au titre de la chanson
        let premiereLigne = NSMutableAttributedString(string: self.chanson.titre, attributes: [.font: UIFont.boldSystemFont(ofSize: 28), .foregroundColor: UIColor.black])
    // Création de la configuration de la seconde ligne correspondant à un retour à la ligne (\n) ainsi que de l'artiste
        let secondeLigne = NSMutableAttributedString(string: "\n" + self.chanson.artiste, attributes: [ .font: UIFont.italicSystemFont(ofSize: 20), .foregroundColor: UIColor.darkGray])
        // Inclure la configuration de la seconde ligne dans la première
        premiereLigne.append(secondeLigne)
        // Attribuer la personnalisation des deux lignes à l'outlet du Label 
        artisteEtTitreLabel.attributedText = premiereLigne
        
    }
    
    
}

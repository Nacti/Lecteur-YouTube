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
    var CellChanson: ClassChanson!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
    }

    // Création de la fonction avec comme paramètre la classe Chanson
    func creerCell(_ chanson: ClassChanson) {
    // Récupération chanson tenant correspondant à la variable créée au début de la classe ChansonCell
    self.CellChanson = chanson
    // Ajout de la fonction telechagerImage
    telechargerImage()        
    // Création de la configuration de la première ligne correspondant au titre de la chanson
        let premiereLigne = NSMutableAttributedString(string: self.CellChanson.titre, attributes: [.font: UIFont.boldSystemFont(ofSize: 28), .foregroundColor: UIColor.black])
    // Création de la configuration de la seconde ligne correspondant à un retour à la ligne (\n) ainsi que de l'artiste
        let secondeLigne = NSMutableAttributedString(string: "\n" + self.CellChanson.artiste, attributes: [ .font: UIFont.italicSystemFont(ofSize: 20), .foregroundColor: UIColor.darkGray])
        // Inclure la configuration de la seconde ligne dans la première
        premiereLigne.append(secondeLigne)
        // Attribuer la personnalisation des deux lignes à l'outlet du Label 
        artisteEtTitreLabel.attributedText = premiereLigne
        
    }
    
    
    func telechargerImage() {
        // Mettre le logo (image importée) si jamais l'image n'est plus disponible sur internet
        miniature.image = #imageLiteral(resourceName: "73 - Logo")
        // Vérifie que la constante juste créer est une URL renvoyer un string correspondant au champs miniatureUrl créé dans Chanson.swift
        if let url = URL(string: self.CellChanson.miniatureUrl) {
        // Récupérer les données depuis l'adresse URL
        let adresseURL = URLSession.shared
        // Création de la tache récupérant une donnée par rapport à l'adresse URL
        let task = adresseURL.dataTask(with: url, completionHandler: { (data, response, error) in
        // S'il il y a une donnée data, création de l'image par rapport imageData
        if let imageData = data, let image = UIImage(data: imageData) {
        // Synchronisation de image avec la miniature
        DispatchQueue.main.async {
        self.miniature.image = image
        }
        }
        })
        // Si pas de réponse, on arrete la requete
        task.resume()
        }
        }
    
    
}









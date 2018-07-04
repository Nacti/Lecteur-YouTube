//
//  TableauController.swift
//  Youtube
//
//  Created by Cédric PETERSEN on 01/07/2018.
//  Copyright © 2018 Cédric PETERSEN. All rights reserved.
//

import UIKit

class TableauController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var tableView: UITableView!
    
    // Création d'un tableau reprenant la classe Chanson
    var tableauChansons = [ClassChanson]()
    
    // Création de l'identifiant de cellule
    let identifiantCell = "ChansonCell"
    
    // Création de l'identifiant du Segue
    let identifiantSegue = "VersVideo"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Indiquer que le delegate du tableView sera celui de la classe Tableau Controller
        tableView.delegate = self
        // Indiquer que le dataSource du tableView sera celui de la classe Tableau Controller
        tableView.dataSource = self
        // Ajout de la fonction ajouterChanson
        ajouterChanson()
        // Ajouter un titre au Navigation Controller
        title = "Mes vidéos préférées"
        
    }

    
    
    
    // Protocole pour afficher le nombre de ligne dans le tableau
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Retourner le nombre de chansons dans le tableau
        return tableauChansons.count
    }
    
    // Protocole pour notifier au TableView pour quelle cellule il va devoir renvoyer les informations
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Récupérer la chanson en question dans le tableau avec la ligne (row) de l'index
        let chanson = tableauChansons[indexPath.row]
        // Si la cellule sélectionnée appartient à la TableViewCell identifiée (identifiantCell = "ChansonCell") avec (as?) la mise en forme ChansonCell
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifiantCell) as? ChansonCell {
        // Créér une cellule personnalisée par rapport à : chanson = chansons[indexPath.row]
        cell.creerCell(chanson)
        // Retourner la cellule
        return cell
        }
        
        // Retour un Table View Cell vide
        return UITableViewCell()
        
    }
    
    
    // Protocole pour définir la hauteur des cellules
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    // Retourne une hauteur de 170
    return 130
    }
    
    
    // Protocole indiquant qu'une ligne a été sélectionnée
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Récupérer la chanson en question dans le tableau avec la ligne (row) de l'index
        let ligneChanson = tableauChansons[indexPath.row]
        // Indique au Segue qu'il faut lire la vidéo de la chanson
       performSegue(withIdentifier: identifiantSegue, sender: ligneChanson)
    }
    // Indique au View Controler que le Segue va lui demande de s'ouvrir
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Si l'idendifiant du Segue correspond bien à "VersVideo"
        if segue.identifier == identifiantSegue {
            // Vérifie que le nouveau controller correspond à la destination du Segue en tant que VideoController
            if let nouveauController = segue.destination as? VideoController {
                // Le nouveau controller va afficher dans chansonVideoController une chanson de ClassChanson
                nouveauController.chansonVideoController = sender as? ClassChanson
            }
        }
    }
    
    

    func ajouterChanson() {
        // S'assurer que le tableau chansons est vide
        tableauChansons = [ClassChanson]()
        // Création des chansons
        let cool = ClassChanson(artiste: "PARIS COMBO", titre: "Je te vois partout", code: "uLSDhkEbM2I")
        let bien = ClassChanson(artiste: "ORLY CHAP", titre: "L'amour avec un gros tas", code: "_4n6bfa_lss")
        let basique = ClassChanson(artiste: "ADDIDESCH", titre: "Mettre à poil", code: "wC_jcEDVPys")
        let ronde = ClassChanson(artiste: "CHARLENE DUVAL", titre: "Svelte", code: "Rk_LXM5Cvr4")
        let san = ClassChanson(artiste: "INA ICH", titre: "Arme armée", code: "SVQKth1ZVGU")
        let seul = ClassChanson(artiste: "LARA FABIAN", titre: "Je suis malade", code: "bIIL5p7_WKk")
        let inacheves = ClassChanson(artiste: "CHOUM", titre: "Les hémorroïdes", code: "niEvZiYcc7k")
        // Ajout des chansons dans le tableau
        tableauChansons.append(contentsOf: [cool, bien, basique, ronde, san, seul, inacheves])
        // Permet de rafraichir le tableView
        tableView.reloadData()
    }

    
    
    

}

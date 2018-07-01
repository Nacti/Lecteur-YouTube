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
    var chansons = [Chanson]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Indiquer que le delegate du tableView sera celui de la classe Tableau Controller
        tableView.delegate = self
        // Indiquer que le dataSource du tableView sera celui de la classe Tableau Controller
        tableView.dataSource = self
        // Ajout de la fonction ajouterChanson
        ajouterChanson()
    }

    
    // Fonction pour afficher le nombre de ligne dans le tableau
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Retourner le nombre de chansons dans le tableau
        return chansons.count
    }
    
    // Fonction pour notifier au TableView pour quelle cellule il va devoir renvoyer les informations
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Renvoiune TableViewCell vide
        return UITableViewCell()
    }
    
    

    func ajouterChanson() {
        // S'assurer que le tableau chansons est vide
        chansons = [Chanson]()
        // Création des chansons
        let cool = Chanson(artiste: "PARIS COMBO", titre: "Living Room", code: "hptx-ofa5Uo")
        let bien = Chanson(artiste: "ORLY CHAP", titre: "L'amour avec un gros tas", code: "_4n6bfa_lss")
        let basique = Chanson(artiste: "ADDIDESCH", titre: "Mettre à poil", code: "wC_jcEDVPys&t=3s")
        let ronde = Chanson(artiste: "CHARLENE DUVAL", titre: "Svelte", code: "Rk_LXM5Cvr4")
        let san = Chanson(artiste: "INA ICH", titre: "Arme armée", code: "SVQKth1ZVGU")
        let seul = Chanson(artiste: "LARA FABIAN", titre: "Je suis malade", code: "bIIL5p7_WKk")
        let inacheves = Chanson(artiste: "CHOUM", titre: "Les hémorroïdes", code: "niEvZiYcc7k")
        // Ajout des chansons dans le tableau
        chansons.append(contentsOf: [cool, bien, basique, ronde, san, seul, inacheves])
        // Permet de rafraichir le tableView
        tableView.reloadData()
    }

    
    
    

}

 //
//  VideoController.swift
//  Youtube
//
//  Created by Cédric PETERSEN on 04/07/2018.
//  Copyright © 2018 Cédric PETERSEN. All rights reserved.
//

import UIKit
 import WebKit

class VideoController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    

    // Ajout de la variable Chanson optionnelle
    var chansonVideoController: ClassChanson?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Vérifier que chansonVideoController est différent de nil
        if  chansonVideoController != nil {
        // Afficher dans le Navigation Controller le titre de la chanson
        title = chansonVideoController!.titre
        // Appel de la fonction chargerVideo
        chargerVideo(chanson: chansonVideoController!)
        }
        
    }
    
    
    func chargerVideo(chanson: ClassChanson) {
        // Vérifier que l'URL que la chanson de la classe Chanson a bien une URL
        if let url = URL(string: chanson.videoUrl) {
            // Création de la requete reprenant l'url de chanson.videoUrl
            let requete = URLRequest(url: url)
            // Demande à l'outlet de WebKit View de
            webView.load(requete)
        }
    }


}

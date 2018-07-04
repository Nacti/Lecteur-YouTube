 //
//  VideoController.swift
//  Youtube
//
//  Created by Cédric PETERSEN on 04/07/2018.
//  Copyright © 2018 Cédric PETERSEN. All rights reserved.
//

import UIKit

class VideoController: UIViewController {

    // Ajout de la variable Chanson optionnelle
    var chansonVideoController: ClassChanson?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Vérifier que chansonVideoController est différent de nil
        if  chansonVideoController != nil {
        // Afficher dans le Navigation Controller le titre de la chanson
        title = chansonVideoController!.titre
        }
        
    }


}

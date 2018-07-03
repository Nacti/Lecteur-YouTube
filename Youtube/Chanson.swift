//
//  Chanson.swift
//  Youtube
//
//  Created by Cédric PETERSEN on 01/07/2018.
//  Copyright © 2018 Cédric PETERSEN. All rights reserved.
//

import Foundation

class Chanson {
    
    private var _artiste: String
    private var _titre: String
    private var _code: String
    private var _baseUrlVideo = "https://www.youtube.com/embed/"
    private var _baseUrlMiniature = "http://i.ytimg.com/vi/"
    private var _finUrlMiniature = "/hqdefault.jpg" // max : HD,
    
    // maxresdefault.jpg = 1920 x 1080 px
    // sddefault.jpg = 640 x 480 px
    // hqdefault.jpg = 480 x 360 px
    // mqdefault.jpg = 320 x 180 px
    // default.jpg = 120 x 90 px
    // 0.jpg = 480 x 360 px
    
    var artiste: String { return _artiste }
    var titre: String { return _titre }
    var videoUrl: String { return _baseUrlVideo + _code } // Vidéo = url youtube + code
    var miniatureUrl: String { return _baseUrlMiniature + _code + _finUrlMiniature } // Miniature = url miniature + code + extension
    
    init(artiste: String, titre: String, code: String) {
        self._artiste = artiste
        self._titre = titre
        self._code = code
    }
    
    
    
    
    
}

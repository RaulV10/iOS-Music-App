//
//  Song.swift
//  iOS-Music-App
//
//  Created by Raul Ernesto Villarreal Sigala on 7/9/18.
//  Copyright © 2018 Raul Ernesto Villarreal Sigala. All rights reserved.
//

import Foundation

class Song {
    var idMusic: Int
    var nombre: String
    var likes: Int
    var escuchados: Int
    
    init(idMusic: String, nombre: String, likes: String, escuchados: String) {
        self.idMusic = Int(idMusic)!
        self.nombre = nombre
        self.likes = Int(likes)!
        self.escuchados = Int(escuchados)!
    }
    
    func getId() -> Int {
        return idMusic
    }
    
    func getNombre() -> String {
        return nombre
    }
    
    func getCleanName() -> String {
        return String(nombre.dropLast(4))
    }
    
    func getLikes() -> Int {
        return likes
    }
    
    func getEscuchados() -> Int {
        return escuchados
    }
    
}

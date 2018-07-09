//
//  ViewController.swift
//  iOS-Music-App
//
//  Created by Raul Ernesto Villarreal Sigala on 7/9/18.
//  Copyright © 2018 Raul Ernesto Villarreal Sigala. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
        
        let url = "http://192.168.0.161/musicApp/Clasicas-Espanol_Completamente-Enamorado.mp3"
        
        player.playStreaming(fileURL: url)
        
    }

}


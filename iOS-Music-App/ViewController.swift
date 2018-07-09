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
    
    @IBOutlet weak var btnPlayPause: UIButton!
    
    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
        
        let url = "http://192.168.0.161/musicApp/Clasicas-Espanol_Completamente-Enamorado.mp3"
        
        player.playStreaming(fileURL: url)
        
    }

    @IBAction func btnPlayPausePressed(_ sender: Any) {
        if player.avPlayer.rate > 0 {
            player.pauseAudio()
            btnPlayPause.setImage(UIImage(named: "icons8-play-50"), for: .normal)
        } else {
            player.playAudio()
            btnPlayPause.setImage(UIImage(named: "icons8-pause-50"), for: .normal)
        }
    }
    
}


//
//  Player.swift
//  iOS-Music-App
//
//  Created by Raul Ernesto Villarreal Sigala on 7/9/18.
//  Copyright © 2018 Raul Ernesto Villarreal Sigala. All rights reserved.
//

import Foundation
import AVKit

class Player {
    
    var avPlayer: AVPlayer!
    
    init() {
        avPlayer = AVPlayer()
    }
    
    func playStreaming(fileURL: String) {
        let url = URL(string: fileURL)
        
        avPlayer = AVPlayer(url: url!)
        avPlayer.play()
        print("Playing stream")
    }
    
    func playAudio() {
        if avPlayer.rate == 0 && avPlayer.error == nil {
            avPlayer.play()
        }
    }
    
    func pauseAudio() {
        if avPlayer.rate > 0 && avPlayer.error == nil {
            avPlayer.pause()
        }
    }
    
}

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
        setSession()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: Selector(("handleInterruption")), name: AVAudioSession.interruptionNotification, object: nil)
        
        player = Player()
        
        let url = "http://192.168.0.161/musicApp/Rock-Espanol_La-Chispa-Adecuada.mp3"
        
        player.playStreaming(fileURL: url)
        
    }
    
    override var canBecomeFirstResponder: Bool { return true }
    
    func setSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        } catch {
            print(error)
        }
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
    
    override func remoteControlReceived(with event: UIEvent?) {
        if event!.type == UIEvent.EventType.remoteControl {
            if event!.subtype == UIEvent.EventSubtype.remoteControlPause {
                print("pause")
                player.pauseAudio()
            } else if event!.subtype == UIEvent.EventSubtype.remoteControlPlay {
                print("This is working")
                player.playAudio()
            }
        }
    }
    
    func handleInterruption(notification: NSNotification) {
        player.pauseAudio()
        
        let interruptionTypeAsObject = notification.userInfo![AVAudioSessionInterruptionTypeKey] as! NSNumber
        
        let interruptionType = AVAudioSession.InterruptionType(rawValue: interruptionTypeAsObject.uintValue)
        
        if let type = interruptionType {
            if type == .ended {
                player.playAudio()
            }
        }
    }
    
}

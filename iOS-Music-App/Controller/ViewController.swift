//
//  ViewController.swift
//  iOS-Music-App
//
//  Created by Raul Ernesto Villarreal Sigala on 7/9/18.
//  Copyright © 2018 Raul Ernesto Villarreal Sigala. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btnPlayPause: UIButton!
    @IBOutlet weak var tblSongs: UITableView!
    @IBOutlet weak var lblPlaying: UILabel!
    
    var player: Player!
    var songs: [Song] = []
    
    var currentId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSession()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: Selector(("handleInterruption")), name: AVAudioSession.interruptionNotification, object: nil)
        
        player = Player()
        
        // let url = "http://192.168.0.161/musicApp/Rock-Espanol_La-Chispa-Adecuada.mp3"
        //player.playStreaming(fileURL: url)
        
        tblSongs.delegate = self
        tblSongs.dataSource = self
        retreiveSongs()
        
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
    
    @IBAction func btnLikePressed(_ sender: Any) {
        if let id = currentId {
            songLiked(id: id)
        }
    }
    
    @IBAction func btnSharePressed(_ sender: Any) {
        
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
    
    func retreiveSongs() {
        let url = URL(string: "http://192.168.0.161/musicApp/getMusic.php")
    
        let task = URLSession.shared.dataTask(with: url!) {
            data, response, error in
            let retreivedList = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(retreivedList!)
            self.parseSongs(data: retreivedList!)
        }
        
        task.resume()
        print("Getting songs")
    }
    
    func songPlayed(id: Int) {
        let url = URL(string: "http://192.168.0.161/musicApp/addPlays.php?idMusic=\(String(id))")
        
        let task = URLSession.shared.dataTask(with: url!) {
            data, response, error in
            let retreivedData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(retreivedData!)        }
        
        task.resume()
        print("Hearing the song")
    }
    
    func songLiked(id: Int) {
        let url = URL(string: "http://192.168.0.161/musicApp/addLikes.php?idMusic=\(String(id))")
        
        let task = URLSession.shared.dataTask(with: url!) {
            data, response, error in
            let retreivedData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(retreivedData!)        }
        
        task.resume()
        print("Like song")
    }
    
    func parseSongs(data: NSString) {
        if data.contains("*") {
            let dataArray = (data as String).split(separator: "*")
            for item in dataArray {
                let itemData = item.split(separator: ",")
                let newSong = Song(idMusic: String(itemData[0]), nombre: String(itemData[1]), likes: String(itemData[2]), escuchados: String(itemData[3]))
                songs.append(newSong)
            }
            for s in songs {
                print(s.getNombre())
            }
            
            DispatchQueue.main.async {
                self.tblSongs.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        cell.lblName.text = songs[indexPath.row].getCleanName()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        player.playStreaming(fileURL: "http://192.168.0.161/musicApp/\(songs[indexPath.row].getNombre())")
        lblPlaying.text = "Playing: \(songs[indexPath.row].getCleanName())"
        songPlayed(id: songs[indexPath.row].getId())
        currentId = songs[indexPath.row].getId()
    }
    
}

//
//  ViewController.swift
//  Xylophone
//
//  Created by Pankaj Kulkarni on 22/03/18.
//  Copyright © 2018 Pankaj Kulkarni. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var player: AVAudioPlayer?
    var selectedSoundFile = ""
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        // Solution 1 : It works
//        let url = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav")!
//
//        do {
//            player = try AVAudioPlayer.init(contentsOf: url)
//            guard let player = player else {
//                return
//            }
//
//            player.prepareToPlay()
//            player.play()
//
//        } catch let error as NSError {
//
//            print(error)
//        }
        
//        // Solution 2
//        if let soundURL = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav") {
//            var mySound: SystemSoundID = 0
//            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//            // Play
//            AudioServicesPlaySystemSound(mySound);
//        }
        
        selectedSoundFile = soundArray[sender.tag-1]
        playSound()
        
    }
    
    func playSound() {
        let soundURL = Bundle.main.url(forResource: selectedSoundFile, withExtension: "wav")
        do {
            player = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        
        player?.play()
    }

}


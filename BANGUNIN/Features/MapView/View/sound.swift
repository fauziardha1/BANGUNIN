//
//  sound.swift
//  BANGUNIN
//
//  Created by FauziArda on 15/11/22.
//

import Foundation
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player : AVAudioPlayer?
    
    
    
    func play()  {
        guard let url = Bundle.main.url(forResource: "simplesound1" , withExtension: ".wav") else {return}
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error while try to play audio form url : \(error.localizedDescription)")
        }
    }
    
}

//
//  AudioPlayer.swift
//  Guess the note prueba
//
//  Created by Mundo Martinez on 4/27/23.
//
import Foundation
import AVFoundation
class AudioPlayer {
    static let shared = AudioPlayer()
    var player: AVAudioPlayer?
    
    private init() {}
    
    func playSound(named soundName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: soundURL, fileTypeHint: AVFileType.wav.rawValue)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}


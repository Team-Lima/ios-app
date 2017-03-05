//
//  ViewController.swift
//  NeuralGuide
//
//  Created by Tudor Avram on 01/03/17.
//  Copyright © 2017 Team Lima. All rights reserved.
//

import UIKit

import Speech
import AVFoundation

class ViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    private let output = AVCapturePhotoOutput()
    private var gameTimer: Timer!
    private let audioSession = AVAudioSession.sharedInstance()
    var isRunningVideo = true
    private var start = false
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))

    var label = UILabel(frame: CGRect(x: 20, y: 20, width: 300, height: 21))
    
    
    let speechSynthesizer = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // getting permissions 
        let status = self.get_permissions()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /**
     Function that outputs the contents of the message
     It
     
     - parameter message:    The message to output
     - returns :             True - if everything is successful
     False - otherwise
     */
    private func talk_back(message:String)->Bool{
        
        do {
            try self.audioSession.setCategory(AVAudioSessionCategoryPlayback)
            try self.audioSession.setMode(AVAudioSessionModeSpokenAudio)
            try self.audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        } catch {
            // Whoops :( Something went wrong here
            return false
        }
        do {
            let speechUtterance = AVSpeechUtterance(string: message)
            try speechUtterance.rate = 0.5
            try speechUtterance.volume = 1
            try speechUtterance.pitchMultiplier = 0.25
            try speechUtterance.voice = AVSpeechSynthesisVoice(identifier: AVSpeechSynthesisVoiceIdentifierAlex)
            try speechSynthesizer.speak(speechUtterance)
        } catch {
            // Something went wrong... Again :(
            return false
        }
        return true
    }
    
    private func get_permissions()->Bool {
        // (1) Get permissions for the speech recognition
        speechRecognizer?.delegate = self  //3
        SFSpeechRecognizer.requestAuthorization { (authStatus) in  //4
            print(authStatus)
        }
        
        
        return true
    }
    


}


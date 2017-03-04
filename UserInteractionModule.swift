//
//  UserInteractionModule.swift
//  NeuralGuide
//
//  Created by Tudor Avram on 01/03/17.
//  Copyright © 2017 Team Lima. All rights reserved.
//

import Foundation
import AVFoundation
import Speech

public class UserInterraction: SFSpeechRecognizerDelegate {
    
    private var audioSession = AVAudioSession
    private var speechSyntesizer: AVSpeechSynthesizer
    private var audioEngine: AVAudioEngine
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))


    public init(test:Double){
        // Setting up the audioEngine
        self.audioEngine = AVAudioEngine()
        
        // Setting up the audioSession
        self.audioSession = AVAudioSession.sharedInstance()
        
        // Setting up the speechSyntesizer
        self.speechSyntesizer = AVSpeechSynthesizer()
        
        
        speechRecognizer?.delegate = self  //3
        SFSpeechRecognizer.requestAuthorization { (authStatus) in  //4
            print(authStatus)
        }
    }
    
    /**
        Function that outputs the contents of the message
        It
        
        - parameter message:    The message to output
        - returns :             True - if everything is successful
                                False - otherwise
    */
    public func talk_back(message:String)->Bool{
        
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
            try speechSyntesizer.speak(speechUtterance)
        } catch {
            // Something went wrong... Again :(
            return false
        }
        return true
    }
    
    public
    
    
}

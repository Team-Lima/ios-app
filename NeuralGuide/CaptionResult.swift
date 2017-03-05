//
//  CaptionResult.swift
//  NeuralGuide
//
//  Created by Tudor Avram on 02/03/17.
//  Copyright © 2017 Team Lima. All rights reserved.
//

import Foundation

public class CaptionResult {
    
    private var successful: Bool
    private var caption: String
    private var confidence: Double
    private var tips: Array<String>
    private var correctFormat: Bool
    
    public init() {
        self.successful = true
        self.caption = ""
        self.confidence = 0.0
        self.tips = []
        self.correctFormat = true
    }
    
    public init(raw: [String:String]) {
        
        do {
            
            self.successful = true
            self.caption = ""
            self.confidence = 0.0
            self.tips = []
            self.correctFormat = true
            
        } catch {
            self.correctFormat = false
        }
        
    }
    
    private func extractKey(dict: [String: String], key: String)throws  -> Any {
        if let value = dict[key] {
            return value
        } else {
            // ERROR: the key is not in the dictionary
            throw HTTPError.WrongJSONFormat
        }
    }
    
    public func isCorrectFormat() -> Bool {
        return self.correctFormat
    }
    
}

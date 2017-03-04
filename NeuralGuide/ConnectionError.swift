//
//  ConnectionError.swift
//  NeuralGuide
//
//  Created by Tudor Avram on 04/03/17.
//  Copyright © 2017 Team Lima. All rights reserved.
//

import Foundation

public class ConnectionError: Error {
    
    private var message = "You are not connected to the Internet. Please try again later";
    
    public init(){
        
    }
    
    public func getMessage()->String{
        return self.message
    }
    
}
